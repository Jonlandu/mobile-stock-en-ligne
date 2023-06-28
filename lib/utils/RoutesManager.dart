import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/Model/EntrepotModele.dart';
import 'package:squelette_mobile_parcours/pages/Articles/ArticleParCategorie.dart';
import 'package:squelette_mobile_parcours/pages/CreateArticlePage.dart';
import 'package:squelette_mobile_parcours/pages/HomePage.dart';

import '../pages/Articles/ArticleDetailsPage.dart';
import '../pages/Articles/ArticleListPage.dart';
import '../pages/Categories/CategorieListPage.dart';
import '../pages/CreerCategoriePage.dart';

import 'package:squelette_mobile_parcours/Model/ArticleModel.dart';
import 'package:squelette_mobile_parcours/pages/Auth/LoginPage.dart';
import 'package:squelette_mobile_parcours/pages/Auth/RegisterPage.dart';
import 'package:squelette_mobile_parcours/pages/CreerCategoriePage.dart';
import 'package:squelette_mobile_parcours/pages/DashboardPage.dart';
import 'package:squelette_mobile_parcours/pages/LoadingPage.dart';
import 'package:squelette_mobile_parcours/pages/CreateArticlePage.dart';
import '../pages/CreationMouvementPage.dart';
import '../pages/DashboardPage.dart';
import '../pages/Entrepot/CreationEntrepotPage.dart';
import '../pages/Entrepot/EntrepotPages.dart';
import '../pages/Mouvements/MouvementListPage.dart';
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
      case Routes.DashboardRoute:
      var args=r.arguments as Map?;
        return MaterialPageRoute(builder: (_) => DashboardPage(entrepot: EntrepotModele.fromJson(args?? {}) ,));
      case Routes.HomeRoute:
        return MaterialPageRoute(builder: (_)=> HomePage());
      case Routes.EntrepotRoute:
        return MaterialPageRoute(builder: (_)=> EntrepotPage());
      case Routes.CreationEntrepotRoute:
        return MaterialPageRoute(builder: (_)=> CreationEntrepotPage());
      case Routes.ListCategorieRoute:
        return MaterialPageRoute(builder: (_)=> ListCategoriePage());
      case Routes.ListArticleRoute:
        return MaterialPageRoute(builder: (_)=> ListArticlePage());
      case Routes.CreationMovementRoute:
        var args=r.arguments as Map?;
        return MaterialPageRoute(builder: (_)=> CreationMouvementPage(article: ArticleModel.fromJson(args?? {}),));
      case Routes.CreerArticlesRoute:
        return MaterialPageRoute(builder: (_)=> ArticlePage());
      case Routes.CreerCategorieRoute :
      return MaterialPageRoute(builder: (_)=> CategoriePage());
      case Routes.DetailsArticleRoute:
        var args=r.arguments as Map?;
        var elt ={};
        var articleData=ArticleModel.fromJson(args ?? elt);
        return MaterialPageRoute(builder: (_)=> DetailsArticlePage(article: articleData));

      case Routes.MovementPageRoute:
        var args=r.arguments as Map?;
        var elt ={};
        return MaterialPageRoute(builder: (_)=> MouvementPage());
      case Routes.ArticleParCategorie:
        var args=r.arguments as Map?;
        var elt ={};
        var articleCategorieData=ArticleModel.fromJson(args ?? elt);
        return MaterialPageRoute(builder: (_)=> ListArticleParCategoriePage(categorie: articleCategorieData,));



      default:
        return MaterialPageRoute(builder: (_) => TemplatePage());
    }
  }
}
