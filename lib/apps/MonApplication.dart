import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/controllers/ArticleController.dart';
import 'package:squelette_mobile_parcours/controllers/CategorieController.dart';
import 'package:squelette_mobile_parcours/utils/StockageKeys.dart';
import '../Controllers/UserController.dart';
import '../utils/RoutesManager.dart';
import 'package:provider/provider.dart';
import '../utils/Routes.dart';

class MonApplication extends StatelessWidget {
  var box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var user=box.read<Map>(StockageKeys.user);
    var usertoken=box.read<Map>(StockageKeys.userToken);
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=> UserController(stockage: box)),
        ChangeNotifierProvider(create: (_)=> ArticleCtrl(stockage: box)),
        ChangeNotifierProvider(create: (_)=> CategorieCtrl(stockage: box)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.route,
        initialRoute: Routes.LoginRoute,
      ),
    );
  }
}
