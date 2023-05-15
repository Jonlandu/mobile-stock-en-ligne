// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? nom;
  String? prenom;
  String? phone;
  String? email;
  String? token;

  UserModel({
    this.id,
    this.nom,
    this.prenom,
    this.phone,
    this.email,
    this.token,
  });

  factory UserModel.fromJson(Map json) => UserModel(
    id: json["id"],
    nom: json["nom"],
    prenom: json["prenom"],
    phone: json["phone"],
    email: json["email"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "prenom": prenom,
    "phone": phone,
    "email": email,
    "token": token,
  };
}
