import 'package:flutter/material.dart';
import 'package:usuario/Models/jsonpost.dart';
import 'package:usuario/Models/userPost.dart';

import 'home.dart';

class Data extends StatelessWidget {
  final comentarios = UserPost();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('formulario'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(onChanged: (valor) => comentarios.name = valor),
            TextField(onChanged: (valor) => comentarios.email = valor),
            TextField(onChanged: (valor) => comentarios.year = valor),
            ElevatedButton(
                onPressed: () async {
                  UserPost comentario = await registrar(comentarios.toJson());
                  print('Guardado ');
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
