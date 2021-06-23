import 'package:flutter/material.dart';

import 'package:usuario/Models/jsonShow.dart';
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
              return Container(
                padding: EdgeInsets.all(15),
                child: Center(
                    child: Column(
                  children: [
                    CircleAvatar(
                      child: Text(
                        snapshot.data.name.substring(0, 1),
                        textScaleFactor: 4.5,
                      ),
                      maxRadius: 60,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      snapshot.data.name,
                      textScaleFactor: 2.5,
                    ),
                    Text(
                      'Email: ${snapshot.data.email}',
                      textScaleFactor: 1.5,
                    ),
                    Text('Edad: ${snapshot.data.year.toString()}'),
                  ],
                )),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

class $ {}
