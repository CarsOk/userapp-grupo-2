// To parse this JSON data, do
//
//     final userShow = userShowFromJson(jsonString);

import 'dart:convert';

UserShow userShowFromJson(String str) => UserShow.fromJson(json.decode(str));

String userShowToJson(UserShow data) => json.encode(data.toJson());

class UserShow {
  UserShow({
    this.id,
    this.name,
    this.email,
    this.year,
  });

  int id;
  String name;
  String email;
  int year;

  factory UserShow.fromJson(Map<String, dynamic> json) => UserShow(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "year": year,
      };
}
