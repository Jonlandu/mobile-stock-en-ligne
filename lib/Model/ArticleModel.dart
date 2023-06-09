// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

ArticleModel articleModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
  int? id;
  String? nomArticle;
  String? descriptionArticle;
  String? unite;
  int? stockMinimal;
  int? stockInitial;
  int? entrepot_id;
  int? qte_stock;

  ArticleModel({
    this.id,
    this.nomArticle,
    this.descriptionArticle,
    this.unite,
    this.stockMinimal,
    this.stockInitial,
    this.entrepot_id,
    this.qte_stock

  });

  factory ArticleModel.fromJson(Map json) => ArticleModel(
    id: json["id"],
    nomArticle: json["nom_article"],
    descriptionArticle: json["description_article"],
    unite: json["unite"],
    stockMinimal: json["stock_minimal"],
    stockInitial: json["stock_initial"],
    entrepot_id: json["categorie_id"],
    qte_stock: json["qte_stock"]

  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "nom_article": nomArticle,
    "description_article": descriptionArticle,
    "unite": unite,
    "stock_minimal": stockMinimal,
    "stock_initial": stockInitial,
    "entrepot_id": entrepot_id,
    "qte_stock" : qte_stock

  };
}