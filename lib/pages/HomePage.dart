import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/HomeController.dart';
import 'package:squelette_mobile_parcours/pages/AccueilPage.dart';
import 'package:squelette_mobile_parcours/pages/Entrepot/EntrepotPages.dart';
import 'package:squelette_mobile_parcours/utils/GlobalColors.dart';

import '../Controllers/UserController.dart';
import '../utils/Routes.dart';
import 'Articles/ArticleListPage.dart';
import 'Categories/CategorieListPage.dart';
import 'Mouvements/MouvementListPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  // int _currentTabIndex = 0;
  Color other = Colors.black;
  Color selectedItem = GlobalColors.orange;

  final pages=[
    AccueilPage(),
    EntrepotPage(),
    ListCategoriePage(),
    ListArticlePage(),
    MouvementPage(),

  ];

  @override
  Widget build(BuildContext context) {
    var ctrl = context.watch<HomeController>();
    return Scaffold(
      appBar: _entete(),
      body:pages[ctrl.currentTabIndex],
      bottomNavigationBar: _footer(),);
  }
  AppBar _entete() {
    return AppBar(
      leading: Container(),
      leadingWidth: 0,
      elevation: 0,
      title: Container(height: 50, child: Image.asset("assets/orange.jpg")),
      backgroundColor: Colors.white,
      actions: [
        IconButton(onPressed: (){
          setState(() {});
          var ctrl = context.read<UserController>();
          Map data = {};
          var res = ctrl.logout(data);
          Navigator.pushReplacementNamed(context, Routes.LoginRoute);
        }, icon: Icon(Icons.logout, color: Colors.black,)),
        SizedBox(width: 20)
      ],
    );
  }
  Widget _footer(){
    var ctrl = context.watch<HomeController>();

    return BottomNavigationBar(
      currentIndex: ctrl.currentTabIndex,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: other,
      selectedItemColor: selectedItem,
      items: [
        BottomNavigationBarItem( icon: Icon(Icons.home),label: "Accueil"),
        BottomNavigationBarItem( icon: Icon(Icons.store_outlined),label: "Entrepot"),
        BottomNavigationBarItem( icon: Icon(Icons.category_outlined), label:"Catégories"),
        BottomNavigationBarItem( icon: Icon(Icons.production_quantity_limits_rounded), label:"Articles"),
        BottomNavigationBarItem( icon: Icon(Icons.compare_arrows),label: "Mouvement"),
      ],
      onTap: (int tabIndex) {
        setState(() {
          ctrl.currentTabIndex = tabIndex;
        });
      },
    );
  }
}