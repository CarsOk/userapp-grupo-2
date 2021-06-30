import 'package:flutter/material.dart';
import 'package:usuario/Models/jsonpost.dart';
import 'package:usuario/Models/userPost.dart';
import 'package:usuario/main.dart';

class Data extends StatelessWidget {
  final comentarios = UserPost();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('formulario'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (valor) => comentarios.name = valor,
              decoration: InputDecoration(
                  hintText: "Nombre",
                  hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.amberAccent,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (valor) => comentarios.email = valor,
              decoration: InputDecoration(
                  hintText: "email",
                  hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  icon: Icon(
                    Icons.email,
                    color: Colors.amberAccent,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (valor) => comentarios.year = valor,
              decoration: InputDecoration(
                  hintText: "Edad",
                  hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  icon: Icon(
                    Icons.date_range,
                    color: Colors.amberAccent,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  UserPost comentario = await registrar(comentarios.toJson());
                  print('Guardado ');
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
