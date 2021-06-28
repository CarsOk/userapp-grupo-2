import 'package:flutter/material.dart';
import 'package:usuario/Models/jsonGet.dart';
import 'package:usuario/Models/userGet.dart';

import 'Data.dart';
import 'info.dart';

class Home extends StatelessWidget {
  final user = User();
  List<User> usuarios;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.group_add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Data()));
        },
      ),
      body: FutureBuilder<List<User>>(
          future: getComment(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              usuarios = snapshot.data;
              return listaComentarios(usuarios);
            }
            return CircularProgressIndicator();
          }),
    );
  }

  ListView listaComentarios(List<User> usuarios) {
    return ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (BuildContext context, int index) {
          User user = usuarios[index];
          return Card(
            child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
                title: Text(user.name),
                subtitle: new Text(user.email),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Info(user.id)));
                }),
          );
        });
  }
}
