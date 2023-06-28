import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/utils/Endpoints.dart';
import 'package:squelette_mobile_parcours/utils/Request.dart';

import '../Model/MouvementModel.dart';
import '../utils/StockageKeys.dart';

class MouvementCtrl with ChangeNotifier {
  GetStorage? stockage;
  bool? loading = false;
  List<MouvementModel> mouvements = [];

  MouvementCtrl({this.stockage});

  Future<HttpResponse> envoieDataMouvement(Map data) async {
    var url = "${Endpoints.mouvementEndpoint}";
    var _token = stockage?.read(StockageKeys.userToken);
    var reponse = await postData(url, data, token: _token);
    if (reponse.status && reponse.data?['status'] == true) {
    }
    return reponse;
  }

  void recupererDataMouvement() async{
    var url = "${Endpoints.mouvementEndpoint}";
    String? token=stockage?.read(StockageKeys.userToken);
    loading = true;
    notifyListeners();
    var response = await getData(url, token: token);
    if(response!=null){
      List<MouvementModel> DataMouvement = response.map<MouvementModel>((e) => MouvementModel.fromJson(e)).toList();
      mouvements = DataMouvement;
      notifyListeners();
      print(mouvements[0]);
    }
    loading = false;
    notifyListeners();
  }

  Future recupererDataMouvementRecent() async{
    var url = "${Endpoints.mouvementsRecentEndpoint}";
    String? token=stockage?.read(StockageKeys.userToken);
    loading = true;
    notifyListeners();
    var response = await getData(url, token: token);
    if(response!=null){
      List<MouvementModel> DataMouvementsRecent = response.map<MouvementModel>((e) => MouvementModel.fromJson(e)).toList();
      mouvements = DataMouvementsRecent;
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }

}

void main() {
  var entr = MouvementCtrl();
  entr.envoieDataMouvement({"nom": 1, "quantite": 200, "motif": "achat"});
}
