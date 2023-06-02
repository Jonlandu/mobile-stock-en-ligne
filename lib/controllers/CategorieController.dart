import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import '../models/CategorieModel.dart';
import '../utils/Endpoints.dart';
import '../utils/StockageKeys.dart';
import '../utils/Requetes.dart';


  class CategorieCtrl with ChangeNotifier {
  // CategorieModel? categorie;
  GetStorage? stockage;
  bool? loading = false;
  List<CategorieModel> categoriesList = [];
  CategorieCtrl({this.stockage});

  Future<HttpResponse> categorie_data_create(Map data) async{
    var url="${Endpoints.createCategorieEndpoints}";
    var _token=stockage?.read(StockageKeys.tokenkey);
    HttpResponse response = await postData(url, data, token: _token);
    //return response;

    if(response.status){
     var categorie = CategorieModel.fromJson(response.data?['categorie'] ?? {});
     categoriesList.add(categorie);
     print("reponse brute : ${response.data}");
     print(" la taille :  ${categoriesList.length}");

     notifyListeners();
    }
    print(response.data);
    print(response.status);
    print(response);
    return response;
  }
  void recuperer_data_categorie() async{
    var url = "${Endpoints.showCategoriesEndpoints}";
    loading = true;
    notifyListeners();
    var response = await getData(url,/* token: token*/);
    if(response!=null){
      List<CategorieModel> DataCategorie = response.map<CategorieModel>((e) => CategorieModel.fromJson(e)).toList();
      categoriesList = DataCategorie;
      notifyListeners();
     print(categoriesList[0]);
    }
    loading = false;
    notifyListeners();
  }
}
void main(){
  var c = CategorieCtrl();
  Map  data = {
    'designation' : 'enfeeeeee',
    'description' : 'est un produit pour les enfants ',
    'entrepot_id' : 1
  };
  c.recuperer_data_categorie();
}