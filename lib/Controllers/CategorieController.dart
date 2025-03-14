
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import '../Model/CategorieModel.dart';
import '../utils/Endpoints.dart';
import '../utils/StockageKeys.dart';
import '../utils/Request.dart';


  class CategorieCtrl with ChangeNotifier {
  // CategorieModel? categorie;
  GetStorage? stockage;
  bool? loading = false;
  List<CategorieModel> categoriesList = [];
  CategorieCtrl({this.stockage});

  Future<HttpResponse> categorieDataCreate(Map data) async{
    var url="${Endpoints.createCategorieEndpoints}";
    var _token=stockage?.read(StockageKeys.userToken);
    HttpResponse response = await postData(url, data,token: _token);
    print('))))))))))))token : ${_token}');
    //return response;

    if(response.status){
     var categorie = CategorieModel.fromJson(response.data?['categorie'] ?? {});
     categoriesList.add(categorie);
     print("reponse brute : ${response.data}");
     print(" la taille :  ${categoriesList.length}");

     notifyListeners();
    }
    print(response.data);
    print(response.status);
    print(response);
    return response;
  }
  void recupererDataCategorie() async{
    var url = "${Endpoints.showCategoriesEndpoints}";
    String? token=stockage?.read(StockageKeys.userToken);
    loading = true;
    notifyListeners();
    var response = await getData(url, token: token);
    if(response!=null){
      List<CategorieModel> DataCategorie = response.map<CategorieModel>((e) => CategorieModel.fromJson(e)).toList();
      categoriesList = DataCategorie;
      notifyListeners();
     print(categoriesList[0]);
    }
    loading = false;
    notifyListeners();
  }
}
void main(){
  var c = CategorieCtrl();
  Map  data = {
    'designation' : 'enfeeeeee',
    'user_id' : 1
  };
  // c.recupererDataCategorie();
  c.categorieDataCreate(data);
}