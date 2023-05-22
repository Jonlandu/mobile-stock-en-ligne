import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Constantes.dart';

class HttpResponse {
  bool status;
  Map? data;
  String? errorMsg;
  bool? isException;

  HttpResponse(
      {this.data, required this.status, this.errorMsg, this.isException});
}

Future<HttpResponse> postData(String api_url, Map data) async {
  try {
    var url = Uri.parse("${Constantes.BASE_URL}$api_url");
    String dataStr = json.encode(data);
    var response =
    await http.post(url, body: dataStr, headers: {"Content-Type":"application/json"}).timeout(Duration(seconds: 5));
    var successList = [200, 201];
    var msg = json.decode(response.body);
    var st = successList.contains(response.statusCode);

    return HttpResponse(status: st, data: msg); // {"status": st, "msg": msg};
    // return null;
  } catch (e, trace) {
    print(e.toString());
    print(trace.toString());
    // return null;
    //return {"status": false, "error_msg": };
    return HttpResponse(
        status: false,
        errorMsg: "Erreur inattendue",
        isException: true); // {"status": st, "msg": msg};
  }
}

