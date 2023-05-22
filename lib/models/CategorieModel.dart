// To parse this JSON data, do
//
//     final categorieModel = categorieModelFromJson(jsonString);

import 'dart:convert';

CategorieModel categorieModelFromJson(String str) => CategorieModel.fromJson(json.decode(str));

String categorieModelToJson(CategorieModel data) => json.encode(data.toJson());

class CategorieModel {
  int id;
  String designation;
  String description;
  DateTime createAt;
  DateTime updatedAt;

  CategorieModel({
    required this.id,
    required this.designation,
    required this.description,
    required this.createAt,
    required this.updatedAt,
  });

  factory CategorieModel.fromJson(Map<String, dynamic> json) => CategorieModel(
    id: json["id"],
    designation: json["designation"],
    description: json["description"],
    createAt: DateTime.parse(json["create_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "designation": designation,
    "description": description,
    "create_at": createAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
