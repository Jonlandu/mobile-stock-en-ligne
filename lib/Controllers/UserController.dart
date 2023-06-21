import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/Model/UserModel.dart';
import 'package:squelette_mobile_parcours/utils/Constantes.dart';
import 'package:squelette_mobile_parcours/utils/Endpoints.dart';
import 'package:squelette_mobile_parcours/utils/StockageKeys.dart';

import '../utils/Request.dart';

class UserController with ChangeNotifier{
  UserModel? user;
  GetStorage? stockage;

  UserController({this.stockage});

  Future<HttpResponse> login(Map data) async{
    var url="${Endpoints.loginEndpoint}";
    HttpResponse response = await postData(url, data);
  if(response.status){
    // if(response!= null/){
      user=UserModel.fromJson(response.data?['user'] ?? {});
      stockage?.write(StockageKeys.user, response.data?["user"] ?? {});
      stockage?.write(StockageKeys.userToken, response.data?["token"]?? "");
      notifyListeners();
    }
  print(response);
  return response;


  }

  Future<HttpResponse> register(Map data) async{
    var url="${Endpoints.registerEndpoint}";
    HttpResponse response = await postData(url, data);
    if(response.status){
      // if(response!= null/){
      user=UserModel.fromJson(response.data?['user'] ?? {});
      stockage?.write("user", response.data?["user"] ?? {});
      stockage?.write("token", response.data?["token"]?? "");
      notifyListeners();
    }

    return response;


  }
  Future<HttpResponse> logout(Map data) async{
    var url="${Endpoints.logoutEndpoint}";

    Future<void>? token=stockage?.remove(StockageKeys.userToken);

    var response = await postData(url, data);


    return response;
  }
}