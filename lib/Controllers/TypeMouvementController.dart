import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../Model/TypeMouvementModel.dart';
import '../utils/Endpoints.dart';
import '../utils/Request.dart';
import '../utils/StockageKeys.dart';

class TypeMouvementCtrl with ChangeNotifier{
  GetStorage? stockage;
  List<TypeMouvementModel> typeMouvements = [];
  TypeMouvementCtrl({this.stockage});

  void recuperDataTypeMouvement() async{
    var url = "${Endpoints.typeMouvementEndpoint}";
    String? token=stockage?.read(StockageKeys.userToken);
    print("url typeMouvement === $url");
    print("token ==== $token");
    notifyListeners();

    var reponse = await getData(url, token: token);
    if(reponse != null){
      List<TypeMouvementModel> tempo = reponse['data'].map<TypeMouvementModel>((e) => TypeMouvementModel.fromJson(e)).toList();
      typeMouvements = tempo;
      print("reponse === $reponse");

      notifyListeners();
    }
  }
}

void main(){
  var entr = TypeMouvementCtrl();
  entr.recuperDataTypeMouvement();
}