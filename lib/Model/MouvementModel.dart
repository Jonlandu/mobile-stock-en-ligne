// To parse this JSON data, do
//
//     final mouvementModel = mouvementModelFromJson(jsonString);

import 'dart:convert';

MouvementModel mouvementModelFromJson(String str) => MouvementModel.fromJson(json.decode(str));

String mouvementModelToJson(MouvementModel data) => json.encode(data.toJson());

class MouvementModel {
  int? id;
  int? typeMouvementId;
  String? motif;
  int? quantite;
  int? articleId;
  DateTime? createdAt;
  DateTime? updatedAt;

  MouvementModel({
    this.id,
    this.typeMouvementId,
    this.motif,
    this.quantite,
    this.articleId,
    this.createdAt,
    this.updatedAt,
  });

  factory MouvementModel.fromJson(Map<String, dynamic> json) => MouvementModel(
    id: json["id"],
    typeMouvementId: json["typeMouvement_id"],
    motif: json["motif"],
    quantite: json["quantite"],
    articleId: json["article_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "typeMouvement_id": typeMouvementId,
    "motif": motif,
    "quantite": quantite,
    "article_id": articleId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
