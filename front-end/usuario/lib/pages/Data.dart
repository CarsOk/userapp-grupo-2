import 'package:flutter/material.dart';
import 'package:usuario/Models/jsonpost.dart';
import 'package:usuario/Models/userPost.dart';

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
            ElevatedButton(
                onPressed: () async {
                  UserPost comentario = await registrar(comentarios.toJson());
                  print('Guardado ');
                },
                child: Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
