import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:squelette_mobile_parcours/Model/ArticleModel.dart';
import '../Model/ArticleModel.dart';
import '../utils/Endpoints.dart';
import '../utils/StockageKeys.dart';
import '../utils/Request.dart';


class ArticleCtrl with ChangeNotifier {

 GetStorage? stockage;
 bool? loading = false;
 List<ArticleModel> articledataList = [];
 ArticleCtrl({this.stockage});

 Future<HttpResponse> articleDataCreate(Map data) async{
  var url="${Endpoints.createArticlesEndpoints}";
  var _token=stockage?.read(StockageKeys.userToken);
  HttpResponse response = await postData(url, data, token: _token);
  //return response;

  if(response.status){
   var article = ArticleModel.fromJson(response.data?['article'] ?? {});
   articledataList.add(article);
   print("reponse brute : ${response.data}");
   print(" la taille :  ${articledataList.length}");

   notifyListeners();
  }
  return response;
 }

Future recupererDataArticles() async{
  var url = "${Endpoints.showArticlesEndpoints}";
  String? token=stockage?.read(StockageKeys.userToken);
  loading = true;
  notifyListeners();
  var response = await getData(url, token: token);
  if(response!=null){

   List<ArticleModel> DataArticle = response.map<ArticleModel>((e) => ArticleModel.fromJson(e)).toList();
   articledataList = DataArticle;

   notifyListeners();
  }
  loading = false;
  notifyListeners();
 }

 Future recupererDataArticlesParCategorie(int categorie_id) async{
   var url = "${Endpoints.articlesParCategorieEndpoint}$categorie_id";
   String? token=stockage?.read(StockageKeys.userToken);
   loading = true;
   notifyListeners();
   var response = await getData(url, token: token);
   if(response!=null){

     List<ArticleModel> DataArticleParCategorie = response.map<ArticleModel>((e) => ArticleModel.fromJson(e)).toList();
     articledataList = DataArticleParCategorie;

     notifyListeners();
   }
   loading = false;
   notifyListeners();
 }


 Future recupererDataArticleRecent() async{
   var url = "${Endpoints.articlesRecentEndpoint}";
   String? token=stockage?.read(StockageKeys.userToken);
   loading = true;
   notifyListeners();
   var response = await getData(url, token: token);
   if(response!=null){
     List<ArticleModel> DataMouvementsRecent = response.map<ArticleModel>((e) => ArticleModel.fromJson(e)).toList();
     articledataList = DataMouvementsRecent;
     notifyListeners();
   }
   loading = false;
   notifyListeners();
 }

}

void main() {
 var c = ArticleCtrl();
 Map data = {
  'nom_article': 'chocolat',
  'description_article': 'un chocolat pour enfant',
  'unite' : 'pc',
  'stock_minimal' : 12,
  'stock_initial' : 10,
  'categorie_id'  : 1,
 };
 c.recupererDataArticlesParCategorie(0);
 print('lien : ${url}');
}
