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
    print(url);

    String? token=stockage?.read(StockageKeys.userToken);
    notifyListeners();

    var reponse = await getData(url);
    if(reponse != null){
      print(reponse);
      List<EntrepotModele> tempo = reponse.map<EntrepotModele>((e) => EntrepotModele.fromJson(e)).toList();
      entrepots = tempo;

      notifyListeners();

      print("niveau controlleur");
    }
  }

  Future<bool> envoieDataEntrepot(Map data) async{
    var url = "${Endpoints.entrepotEndpoint}";
    print(url);

    var reponse = await postData(url, data);

    if(reponse.status){
      print(reponse.data);
      List<EntrepotModele> tempo = [reponse.data].map<EntrepotModele>((e) => EntrepotModele.fromJson(e!)).toList();
      entrepots.add(tempo as EntrepotModele) ;

      notifyListeners();
      return true;
    }
    return false;
  }
}

void main(){
  var entr = EntrepotCtrl();
  entr.envoieDataEntrepot({"nom":"Entrepot30"});
}

