import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/Model/UserModel.dart';
import 'package:squelette_mobile_parcours/utils/Constantes.dart';

import '../utils/Request.dart';

class UserController with ChangeNotifier{
  UserModel? user;
  GetStorage? stockage;

  UserController({this.stockage});

  Future<HttpResponse> login(Map data) async{
    var url="${Constantes.loginEndpoint}";
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

  Future<HttpResponse> register(Map data) async{
    var url="${Constantes.registerEndpoint}";
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
}