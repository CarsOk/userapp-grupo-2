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
        title: Text('formulario'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (valor) => comentarios.name = valor,
              decoration: InputDecoration(hintText: "Nombre"),
            ),
            TextField(
              onChanged: (valor) => comentarios.email = valor,
              decoration: InputDecoration(hintText: "email"),
            ),
            TextField(
              onChanged: (valor) => comentarios.year = valor,
              decoration: InputDecoration(hintText: "Edad"),
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
