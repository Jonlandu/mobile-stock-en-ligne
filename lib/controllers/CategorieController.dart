import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/models/CategorieModel.dart';
import 'package:squelette_mobile_parcours/models/CategorieModel.dart';
import 'package:squelette_mobile_parcours/utils/Endpoints.dart';
import 'package:squelette_mobile_parcours/utils/StockageKeys.dart';
import '../utils/Constantes.dart';
import '../utils/requetes.dart';

class CategorieCtrl with ChangeNotifier {
    CategorieModel? categorie;
  bool loading = false;
  GetStorage? stockage;
  CategorieCtrl({this.stockage, this.categorie});
  void recuperer_data() async {
    //var token=stockage?.read(StockageKeys.tokenyKey) ;
    var url =Endpoints.categorieApi;
    var data={
      'designation' : 'adulte',
      'description' : ' vsdqbsbqndssnq'
    };

    loading = true;
    notifyListeners();
    var reponse = await postData(url, data);
    if(reponse!=null){
      print("data : $reponse");
      categorie= CategorieModel.fromJson(reponse['data']);
      notifyListeners();
      print(categorie);

    }
    loading = false;
    notifyListeners();
  }


}

void main(){
  var c = CategorieCtrl();
  c.recuperer_data();
}