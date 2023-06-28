// To parse this JSON data, do
//
//     final mouvementModel = mouvementModelFromJson(jsonString);

import 'dart:convert';

MouvementModel mouvementModelFromJson(String str) => MouvementModel.fromJson(json.decode(str));

String mouvementModelToJson(MouvementModel data) => json.encode(data.toJson());

class MouvementModel {
  int? id;
  int? type_id;
  int? quantique;
  int? article_id;
  String? motif;
  String? etat;
  String? nom_article;
  String? designation;
  String? unite;
  DateTime? created_at;
  DateTime? updated_at;

  MouvementModel({
    this.id,
    this.type_id,
    this.quantique,
    this.article_id,
    this.motif,
    this.etat,
    this.nom_article,
    this.designation,
    this.unite,
    this.created_at,
    this.updated_at,
  });

  factory MouvementModel.fromJson(Map<String, dynamic> json) => MouvementModel(
    id: json["id"],
    type_id: json["type_id"],
    quantique: json["quantique"],
    article_id: json["article_id"],
    motif: json["motif"],
    etat: json["etat"],
    nom_article: json["nom_article"],
    designation: json["designation"],
    unite: json["unite"],
    created_at: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updated_at: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type_id": type_id,
    "quantite": quantique,
    "article_id": article_id,
    "motif": motif,
    "etat": etat,
    "nom_article": nom_article,
    "designation": designation,
    "unite": unite,
    "created_at": created_at?.toIso8601String(),
    "updated_at": updated_at?.toIso8601String(),
  };
}
