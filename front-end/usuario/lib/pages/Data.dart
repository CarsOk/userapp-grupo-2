import 'package:flutter/material.dart';
import 'package:usuario/Models/jsonpost.dart';
import 'package:usuario/Models/userPost.dart';
import 'package:usuario/main.dart';
import 'package:usuario/pages/home.dart';

class Data extends StatelessWidget {
  final comentarios = UserPost();
  final formKey = new GlobalKey<FormState>();
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
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (valor) =>
                      valor.length < 1 ? 'nombre invalido' : null,
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
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (valor) =>
                      !valor.contains('@') ? 'email invalido' : null,
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
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (valor) =>
                      valor.length <= 1 ? 'edad invalida' : null,
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
                      final form = formKey.currentState;
                      if (form.validate()) {
                        form.save();
                        UserPost comentario =
                            await registrar(comentarios.toJson());
                        print('Guardado ');
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      }
                    },
                    child: Text('Guardar'))
              ],
            )),
      ),
    );
  }
}
