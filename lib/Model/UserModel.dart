// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? name;
  String? firstname;
  String? phone;
  String? email;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.firstname,
    this.phone,
    this.email,
    this.token,
  });

  factory UserModel.fromJson(Map json) => UserModel(
    id: json["id"],
    name: json["name"],
    firstname: json["firstname"],
    phone: json["phone"],
    email: json["email"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "firstname": firstname,
    "phone": phone,
    "email": email,
    "token": token,
  };
}
