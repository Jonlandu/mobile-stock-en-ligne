// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

ArticleModel articleModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
  String? nomArticle;
  String? descriptionArticle;
  String? unite;
  int? stockMinimal;
  int? stockInitial;
  int? categorieId;
  int? entrepotId;

  ArticleModel({
    this.nomArticle,
    this.descriptionArticle,
    this.unite,
    this.stockMinimal,
    this.stockInitial,
    this.categorieId,
    this.entrepotId,
  });

  factory ArticleModel.fromJson(Map json) => ArticleModel(
    nomArticle: json["nom_article"],
    descriptionArticle: json["description_article"],
    unite: json["unite"],
    stockMinimal: json["stock_minimal"],
    stockInitial: json["stock_initial"],
    categorieId: json["categorie_id"],
    entrepotId: json["entrepot_id"],
  );

  Map<String, dynamic> toJson() => {
    "nom_article": nomArticle,
    "description_article": descriptionArticle,
    "unite": unite,
    "stock_minimal": stockMinimal,
    "stock_initial": stockInitial,
    "categorie_id": categorieId,
    "entrepot_id": entrepotId,
  };
}