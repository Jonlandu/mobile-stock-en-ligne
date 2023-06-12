// To parse this JSON data, do
//
//     final categorieModel = categorieModelFromJson(jsonString);

import 'dart:convert';

CategorieModel categorieModelFromJson(String str) => CategorieModel.fromJson(json.decode(str));

String categorieModelToJson(CategorieModel data) => json.encode(data.toJson());

class CategorieModel {
  int? id;
  String? designation;
  int? user_id;


  CategorieModel({
    this.id,
    this.designation,
    this.user_id

  });

  factory CategorieModel.fromJson(Map json) => CategorieModel(
    id: json["id"],
    designation: json["designation"],
    user_id: json["user_id"]

  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "designation": designation,
    "user_id" : user_id

  };
}
