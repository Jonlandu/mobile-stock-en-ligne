import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import '../models/CategorieModel.dart';
import '../utils/Endpoints.dart';
import '../utils/StockageKeys.dart';
import '../utils/Requetes.dart';


class CategorieCtrl with ChangeNotifier {
  CategorieModel? categorie;
  GetStorage? stockage;
  bool? loading = false;
  CategorieCtrl({this.stockage});

  Future<HttpResponse> categorie_data_create(Map data) async{
    var url="${Endpoints.createArticleEndpoints}";
    HttpResponse response = await postData(url, data);
    if(response.status){
      categorie = CategorieModel.fromJson(response.data?['categorie'] ?? {});
      stockage?.write("categorie", response.data?["categorie"] ?? {});
      stockage?.write("token", response.data?["token"]?? "");
      notifyListeners();
    }
    print(response.data);
    print(response.status);
    print(response);
    return response;
  }
  void recuperer_data_categorie() async{
    var token=stockage?.read(StockageKeys.tokenkey) ;
    var url = "${Endpoints.showArticlesEndpoints}";
    loading = true;
    notifyListeners();
    var response = await getData(url, token: token);
    if(response!=null){
      categorie = CategorieModel.fromJson(response['categorie'] ?? {});
      notifyListeners();
      print(categorie);
    }
    loading = false;
    notifyListeners();
  }
}
void main(){
  var c = CategorieCtrl();
  var map = {
    'designation' : 'vieux',
    'description' : 'le medicament pour les plus de 60 ans'
  };
  c.recuperer_data_categorie();
}