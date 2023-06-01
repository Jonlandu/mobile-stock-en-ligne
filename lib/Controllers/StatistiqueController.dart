import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/Endpoints.dart';
import '../utils/Request.dart';
import '../utils/StockageKeys.dart';

class StatistiqueController with ChangeNotifier{
int articleNbre=0;

GetStorage? stockage;
var usertoken;

StatistiqueController({this.stockage});

  Future<Map?> compteArticle(int entrepot_id) async{

    var url="${Endpoints.compteArticle}$entrepot_id";
    // lecture token stocke
    usertoken=stockage?.read<String?>(StockageKeys.userToken);
    Map? response = await getData(url, token:usertoken);
    if(response!=null){
      response?["data"];
      notifyListeners();
    }
    print(response);
    return response;


  }
}