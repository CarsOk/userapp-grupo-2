import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:reto/paginas/clases2.dart';

class Formulario extends StatefulWidget {
  Formulario({Key key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final comentarios = Usuario();
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
                  Usuario comentario = await registrar(comentarios.toJson());
                  print('Guardado ');
                },
                child: Text('Guardar'))
          ],
        ),
      ),
    );
  }
}

Future<Usuario> registrar(Map<String, dynamic> datos) async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  final response = await http.post(url, body: datos);
  if (response.statusCode == 201) {
    return usuarioFromJson(response.body);
  } else {
    return null;
  }
}
