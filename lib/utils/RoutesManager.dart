import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/pages/CreateArticlePage.dart';

import '../pages/CreerCategoriePage.dart';

import 'package:squelette_mobile_parcours/pages/Auth/LoginPage.dart';
import 'package:squelette_mobile_parcours/pages/Auth/RegisterPage.dart';
import 'package:squelette_mobile_parcours/pages/DashboardPage.dart';
import 'package:squelette_mobile_parcours/pages/Entrepot/EntrepotPages.dart';
import 'package:squelette_mobile_parcours/pages/LoadingPage.dart';

import '../pages/Entrepot/CreationEntrepotPage.dart';
import '../pages/TemplatePage.dart';

import 'Routes.dart';

class RoutesManager {
  static Route route(RouteSettings r) {
    switch (r.name) {
      case Routes.TemplateRoutes:
        //var args=r.arguments as String?;
        return MaterialPageRoute(builder: (_) => CategoriePage());

        //var args=r.arguments as String?;
        return MaterialPageRoute(builder: (_) => TemplatePage());
      case Routes.LoadingRoutes:
        return MaterialPageRoute(builder: (_) => LoadingPage());
      case Routes.LoginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.RegisterRoute:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case Routes.CategorieRoute:
      return MaterialPageRoute(builder: (_) => CategoriePage());
      case Routes.ArticlesRoute:
        return MaterialPageRoute(builder: (_) => ArticlePage());
        return MaterialPageRoute(builder: (_)=> RegisterPage());
      case Routes.DashboardRoute:
        return MaterialPageRoute(builder: (_) => DashboardPage());
      case Routes.EntrepotRoute:
        return MaterialPageRoute(builder: (_)=> EntrepotPage());
      case Routes.CreationEntrepotRoute:
        return MaterialPageRoute(builder: (_)=> CreationEntrepotPage());

        default:
        return MaterialPageRoute(builder: (_) => CategoriePage());
    }
  }
}
