import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/utils/Endpoints.dart';
import 'package:squelette_mobile_parcours/utils/Request.dart';

import '../Model/MouvementModel.dart';
import '../utils/StockageKeys.dart';

class MouvementCtrl with ChangeNotifier{
  GetStorage? stockage;
  List<MouvementModel> mouvements = [];
  MouvementCtrl({this.stockage});

  Future<bool> envoieDataMouvement(Map data) async {
    var url = "${Endpoints.mouvementEndpoint}";
    var _token=stockage?.read(StockageKeys.tokenkey);
    print("url mouvement === $url");
    var reponse = await postData(url, data,  token: _token);

    if (reponse.status) {
      var tempo = MouvementModel.fromJson(reponse.data?["mouvement"]);
      mouvements.add(tempo);
      print("reponse === $reponse");
      notifyListeners();

      return true;
    }
    return false;
  }
}
void main(){
  var entr = MouvementCtrl();
  entr.envoieDataMouvement({

    "nom":1,
    "quantite":200,
    "motif":"achat"
  });
}