import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../apps/MonApplication.dart';
import 'Constantes.dart';

class HttpResponse {
  bool status;
  Map? data;
  String? errorMsg;
  bool? isException;

  HttpResponse(
      {this.data, required this.status, this.errorMsg, this.isException});
}
/*
Future<dynamic> getData(String api_url) async{

  try {
    var url=Uri.parse("${Constantes.BASE_URL}$api_url");
    var response = await http.get(url);
    print(response.runtimeType); // Les types de données
    print(response.body.runtimeType); // Les types de données
    print(response.body); // Les resultats de la reponse
=======

Future<dynamic> getData(String url_api, {String? token}) async {
  try {
    var url = Uri.parse("${Constantes.BASE_URL}$url_api");
    print("url===== $url");
    var _tkn = token ?? Constantes.DefaultToken;
    var response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $_tkn"
    });
>>>>>>> 29919479bae310cb716fb4b6885ad1474fa60559
    print(response.statusCode); // contient le code de http
    if (response.statusCode == 200) {
      var rep = json.decode(response.body);
      print("****** $rep");
      return rep;
    }
    return null;
  } catch (e, trace) {
    print(e.toString());
    print(trace.toString());
    return null;
  }
}

<<<<<<< HEAD
 */

Future<dynamic> getData(String url_api, {String? token}) async {
  try {
    var url = Uri.parse("${Constantes.BASE_URL}$url_api");
    print("url===== $url");
    var _tkn = token ?? Constantes.DefaultToken;
    var response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $_tkn"
    });
    print(response.statusCode); // contient le code de http
    if (response.statusCode == 200) {
      var rep = json.decode(response.body);
      print("****** $rep");
      return rep;
    }
    return null;
  } catch (e, trace) {
    print(e.toString());
    print(trace.toString());
    return null;
  }
}

Future<HttpResponse> postData(String api_url, Map data, {String? token}) async {
  try {
    var url = Uri.parse("${Constantes.BASE_URL}$api_url");

    print("url mouvement === $url");
    String dataStr = json.encode(data);
    var _tkn = token ?? Constantes.DefaultToken;
    var response = await http.post(url, body: dataStr, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $_tkn"
    }).timeout(Duration(seconds: 5));
    if (!kReleaseMode) alice.onHttpResponse(response);
    var successList = [200, 201];
    print("response body ${response.body}");
    var msg = json.decode(response.body);
    var st = successList.contains(response.statusCode);
    if (response.statusCode == 500) throw Exception(msg);

    return HttpResponse(status: st, data: msg); // {"status": st, "msg": msg};
    // return null;
  } catch (e, trace) {
    print(e.toString());
    print(trace.toString());
    // return null;
    //return {"status": false, "error_msg": };
    return HttpResponse(
        status: false,
        errorMsg: "Erreur inattendue, Problème de connexion",
        isException: true); // {"status": st, "msg": msg};
  }
}
