// To parse this JSON data, do
//
//     final entrepotModele = entrepotModeleFromJson(jsonString);

import 'dart:convert';

EntrepotModele entrepotModeleFromJson(String str) => EntrepotModele.fromJson(json.decode(str));

String entrepotModeleToJson(EntrepotModele data) => json.encode(data.toJson());

class EntrepotModele {
  String? nom;
  int? userId;
  DateTime? createdAt;

  EntrepotModele({
    this.nom,
    this.userId,
    this.createdAt,
  });

  factory EntrepotModele.fromJson(Map json) => EntrepotModele(
    nom: json["nom"],
    userId: json["user_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    "user_id": userId,
    "created_at": createdAt?.toIso8601String(),
  };
}
