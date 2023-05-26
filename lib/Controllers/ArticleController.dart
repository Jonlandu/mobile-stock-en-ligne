import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/controllers/CategorieController.dart';
import 'package:squelette_mobile_parcours/models/ArticleModel.dart';
import 'package:http/http.dart' as http;

import '../models/CategorieModel.dart';
import '../utils/Constantes.dart';
import '../utils/Endpoints.dart';
import '../utils/Requetes.dart';
import '../utils/StockageKeys.dart';

class ArticleController with ChangeNotifier{
 ArticleModel? article;
 CategorieModel? categorie;
 GetStorage? stockage;
 ArticleController({this.stockage});
 bool loading = false;
 List<ArticleModel> articleData = [] ;


  }

void main(){
  var test = ArticleController();
  // test.recuperer_data_categorie();
}