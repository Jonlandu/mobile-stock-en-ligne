// To parse this JSON data, do
//
//     final typeMouvementModel = typeMouvementModelFromJson(jsonString);

import 'dart:convert';

TypeMouvementModel typeMouvementModelFromJson(String str) => TypeMouvementModel.fromJson(json.decode(str));

String typeMouvementModelToJson(TypeMouvementModel data) => json.encode(data.toJson());

class TypeMouvementModel {
  int? id;
  String? designation;
  int? etat;
  DateTime? createdAt;
  DateTime? updatedAt;

  TypeMouvementModel({
    this.id,
    this.designation,
    this.etat,
    this.createdAt,
    this.updatedAt,
  });

  factory TypeMouvementModel.fromJson(Map<String, dynamic> json) => TypeMouvementModel(
    id: json["id"],
    designation: json["designation"],
    etat: json["etat"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "designation": designation,
    "etat": etat,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
