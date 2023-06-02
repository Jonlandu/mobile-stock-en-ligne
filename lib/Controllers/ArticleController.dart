import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/models/ArticleModel.dart';
import '../models/ArticleModel.dart';
import '../utils/Endpoints.dart';
import '../utils/StockageKeys.dart';
import '../utils/Requetes.dart';


class ArticleCtrl with ChangeNotifier {

 GetStorage? stockage;
 bool? loading = false;
 List<ArticleModel> articledataList = [];
 ArticleCtrl({this.stockage});

 Future<HttpResponse> article_data_create(Map data) async{
  var url="${Endpoints.createArticlesEndpoints}";
  var _token=stockage?.read(StockageKeys.tokenkey);
  HttpResponse response = await postData(url, data, token: _token);
  //return response;

  if(response.status){
   var article = ArticleModel.fromJson(response.data?['article'] ?? {});
   articledataList.add(article);
   print("reponse brute : ${response.data}");
   print(" la taille :  ${articledataList.length}");

   notifyListeners();
  }
  print(response.data);
  print(response.status);
  print(response);
  return response;
 }

 void recuperer_data_articles() async{
  var url = "${Endpoints.showArticlesEndpoints}";
  loading = true;
  notifyListeners();
  var response = await getData(url,/* token: token*/);
  if(response!=null){

   List<ArticleModel> DataArticle = response.map<ArticleModel>((e) => ArticleModel.fromJson(e)).toList();
   articledataList = DataArticle;

   notifyListeners();
   print(DataArticle[0]);
  }
  loading = false;
  notifyListeners();
 }
}
void main() {
 var c = ArticleCtrl();
 Map data = {
  'nom_article': 'biscuit',
  'description_article': 'un biscuit pour enfants',
  'unite' : 'pc',
  'stock_minimal' : 12,
  'stock_initial' : 10,
  'categorie_id'  : 2,
  'entrepot_id'  : 1
 };
 c.recuperer_data_articles();
}
