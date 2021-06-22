// To parse this JSON data, do
//
//     final userPost = userPostFromJson(jsonString);

import 'dart:convert';

UserPost userPostFromJson(String str) => UserPost.fromJson(json.decode(str));

String userPostToJson(UserPost data) => json.encode(data.toJson());

class UserPost {
  UserPost({
    this.name,
    this.email,
    this.year,
  });

  String name;
  String email;
  String year;

  factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
        name: json["name"],
        email: json["email"],
        year: json["year"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "year": year,
      };
}
