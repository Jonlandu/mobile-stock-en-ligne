import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/Model/ArticleModel.dart';
import 'package:squelette_mobile_parcours/pages/Auth/LoginPage.dart';
import 'package:squelette_mobile_parcours/pages/Auth/RegisterPage.dart';
import 'package:squelette_mobile_parcours/pages/DetailsArticlePage.dart';
import 'package:squelette_mobile_parcours/pages/ListArticlePage.dart';
import 'package:squelette_mobile_parcours/pages/LoadingPage.dart';

import '../pages/CreationMouvementPage.dart';
import '../pages/Entrepot/CreationEntrepotPage.dart';
import '../pages/Entrepot/EntrepotPages.dart';
import '../pages/ListCategoriePage.dart';
import '../pages/TemplatePage.dart';
import 'Routes.dart';

class RoutesManager {
  static Route route(RouteSettings r) {
    switch (r.name) {
      case Routes.TemplateRoutes:


        return MaterialPageRoute(builder: (_) => TemplatePage());
      case Routes.LoadingRoutes:
        return MaterialPageRoute(builder: (_) => LoadingPage());
      case Routes.LoginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.RegisterRoute:
        return MaterialPageRoute(builder: (_)=> RegisterPage());
      case Routes.EntrepotRoute:
        return MaterialPageRoute(builder: (_)=> EntrepotPage());
      case Routes.CreationEntrepotRoute:
        return MaterialPageRoute(builder: (_)=> CreationEntrepotPage());
      case Routes.ListCategorieRoute:
        return MaterialPageRoute(builder: (_)=> ListCategoriePage());
      case Routes.ListArticleRoute:
        return MaterialPageRoute(builder: (_)=> ListArticlePage());
      case Routes.DetailsArticleRoute:
        var args=r.arguments as Map?;
        var elt ={};
        var articleData=ArticleModel.fromJson(args ?? elt);

        return MaterialPageRoute(builder: (_)=> DetailsArticlePage(article: articleData));


      default:
        return MaterialPageRoute(builder: (_) => TemplatePage());
    }
  }
}
