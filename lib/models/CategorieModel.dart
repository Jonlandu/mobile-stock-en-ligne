// To parse this JSON data, do
//
//     final categorieModel = categorieModelFromJson(jsonString);

import 'dart:convert';

CategorieModel categorieModelFromJson(String str) => CategorieModel.fromJson(json.decode(str));

String categorieModelToJson(CategorieModel data) => json.encode(data.toJson());

class CategorieModel {

  String? designation;
  String? description;


  CategorieModel({

    this.designation,
    this.description,

  });

  factory CategorieModel.fromJson(Map json) => CategorieModel(

    designation: json["designation"],
    description: json["description"],

  );

  Map<String, dynamic> toJson() => {

    "designation": designation,
    "description": description,

  };
}
