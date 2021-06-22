import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reto/paginas/clases.dart';
import 'package:reto/paginas/formulario.dart';

class Lista extends StatefulWidget {
  Lista({Key key}) : super(key: key);

  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  void initState() {
    super.initState();
    getDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lista'),
      ),
      body: FutureBuilder(
        future: getDatos(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Usuarios>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Usuarios> comentarios = snapshot.data;
            return listacomentarios(comentarios);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Formulario()),
            );
          },
          child: Icon(
            Icons.add_sharp,
          )),
    );
  }
}

ListView listacomentarios(List<Usuarios> comentarios) {
  return ListView.builder(
    itemCount: comentarios.length,
    itemBuilder: (BuildContext context, int index) {
      Usuarios lista = comentarios[index];
      return Column(
        children: [
          ListTile(
            title: Text('${lista.email})'),
            leading: Icon(Icons.email),
            subtitle: Text(lista.name),
          )
        ],
      );
    },
  );
}

Future<List<Usuarios>> getDatos() async {
  final url = Uri.parse('http://127.0.0.1:3000/people');
  final response = await http.get(url);
  print(response.body);
  if (response.statusCode == 200) {
    return usuariosFromJson(response.body);
  } else {
    return null;
  }
}
