import 'package:flutter/material.dart';

import 'package:usuario/Models/jsonShow.dart';
import 'package:usuario/Models/userGet.dart';
import 'package:usuario/Models/userShow.dart';

class Info extends StatelessWidget {
  int id;
  Info(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion de usuario'),
      ),
      body: FutureBuilder<UserShow>(
          future: showComment(id),
          builder: (BuildContext context, AsyncSnapshot<UserShow> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Text(snapshot.data.name),
                  Text(snapshot.data.email),
                  Text(snapshot.data.year.toString()),
                ],
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
