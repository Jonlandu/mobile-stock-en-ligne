// To parse this JSON data, do
//
//     final entrepotModele = entrepotModeleFromJson(jsonString);

import 'dart:convert';

EntrepotModele entrepotModeleFromJson(String str) => EntrepotModele.fromJson(json.decode(str));

String entrepotModeleToJson(EntrepotModele data) => json.encode(data.toJson());

class EntrepotModele {
  int? id;
  String? nom;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  EntrepotModele({
    this.id,
    this.nom,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory EntrepotModele.fromJson(Map json) => EntrepotModele(
    id: json["id"],
    nom: json["nom"],
    userId: json["user_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "user_id": userId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
