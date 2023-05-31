// To parse this JSON data, do
//
//     final categorieModel = categorieModelFromJson(jsonString);

import 'dart:convert';

CategorieModel categorieModelFromJson(String str) => CategorieModel.fromJson(json.decode(str));

String categorieModelToJson(CategorieModel data) => json.encode(data.toJson());

class CategorieModel {
  int? id;
  String? designation;
  String? description;
  int? entrepot_id;


  CategorieModel({
    this.id,
    this.designation,
    this.description,
    this.entrepot_id

  });

  factory CategorieModel.fromJson(Map json) => CategorieModel(
    id: json["id"],
    designation: json["designation"],
    description: json["description"],
    entrepot_id: json["entrepot_id"]

  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "designation": designation,
    "description": description,
    "entrepot_id": entrepot_id

  };
}
