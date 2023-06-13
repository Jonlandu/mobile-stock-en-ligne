import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/Controllers/MouvementController.dart';
import 'package:squelette_mobile_parcours/Controllers/StatistiqueController.dart';
import 'package:squelette_mobile_parcours/Controllers/ArticleController.dart';
import 'package:squelette_mobile_parcours/Controllers/CategorieController.dart';
import 'package:squelette_mobile_parcours/Controllers/EntrepotsController.dart';
import 'package:squelette_mobile_parcours/Controllers/TypeMouvementController.dart';
import 'package:squelette_mobile_parcours/utils/StockageKeys.dart';
import '../Controllers/HomeController.dart';
import '../Controllers/UserController.dart';
import '../utils/RoutesManager.dart';
import 'package:provider/provider.dart';
import '../utils/Routes.dart';

class MonApplication extends StatelessWidget {
  var box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var user=box.read<Map>(StockageKeys.user);
    var usertoken=box.read<String?>(StockageKeys.userToken);
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=> UserController(stockage: box)),
        ChangeNotifierProvider(create: (_)=> StatistiqueController(stockage: box)),
        ChangeNotifierProvider(create: (_)=> ArticleCtrl(stockage: box)),
        ChangeNotifierProvider(create: (_)=> CategorieCtrl(stockage: box)),
        ChangeNotifierProvider(create: (_)=> EntrepotCtrl(stockage: box)),
        ChangeNotifierProvider(create: (_)=> HomeController()),
        ChangeNotifierProvider(create: (_)=> MouvementCtrl(stockage: box)),
        ChangeNotifierProvider(create: (_)=> TypeMouvementCtrl(stockage: box)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.route,
        initialRoute: Routes.LoadingRoutes,
      ),
    );
  }
}
