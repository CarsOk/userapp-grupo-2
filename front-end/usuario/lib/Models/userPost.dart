// To parse this JSON data, do
//
//     final userPost = userPostFromJson(jsonString);

import 'dart:convert';

UserPost userPostFromJson(String str) => UserPost.fromJson(json.decode(str));

String userPostToJson(UserPost data) => json.encode(data.toJson());

class UserPost {
  UserPost({
    this.id,
    this.name,
    this.email,
    this.year,
  });

  int id;
  String name;
  String email;
  int year;

  factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
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
