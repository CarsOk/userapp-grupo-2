// To parse this JSON data, do
//
//     final usuarios = usuariosFromJson(jsonString);

import 'dart:convert';

List<Usuarios> usuariosFromJson(String str) =>
    List<Usuarios>.from(json.decode(str).map((x) => Usuarios.fromJson(x)));

String usuariosToJson(List<Usuarios> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuarios {
  Usuarios({
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int id;
  String name;
  String email;
  String body;

  factory Usuarios.fromJson(Map<String, dynamic> json) => Usuarios(
        id: json["id"],
        name: json["nombre"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": name,
        "body": body,
        "email": email,
      };
}
