import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:squelette_mobile_parcours/utils/StockageKeys.dart';
import '../Model/EntrepotModele.dart';
import '../utils/Endpoints.dart';
import '../utils/Request.dart';


class EntrepotCtrl with ChangeNotifier {
  List<EntrepotModele> entrepots = [];
  GetStorage? stockage;

  EntrepotCtrl({this.stockage});

  void recuperDataEntrepot() async{
    var url = "${Endpoints.entrepotEndpoint}";
    String? token=stockage?.read(StockageKeys.userToken);

    notifyListeners();

    var reponse = await getData(url, token: token);
    if(reponse != null){
      List<EntrepotModele> tempo = reponse.map<EntrepotModele>((e) => EntrepotModele.fromJson(e)).toList();
      entrepots = tempo;

      notifyListeners();
    }
  }

  Future<HttpResponse> envoieDataEntrepot(Map data) async{
    var url = "${Endpoints.entrepotEndpoint}";
    String? token=stockage?.read(StockageKeys.userToken);
    var reponse = await postData(url, data, token: token);
    if(reponse.status){
      var tempo = EntrepotModele.fromJson(reponse.data?["entrepot"]);
      entrepots.add(tempo);

      notifyListeners();

    }
    return reponse;;
  }
}

void main(){
  var entr = EntrepotCtrl();
  entr.envoieDataEntrepot({"nom":"Entrepot30"});
}

