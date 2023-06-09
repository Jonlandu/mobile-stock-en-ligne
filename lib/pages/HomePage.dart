import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/pages/Entrepot/EntrepotPages.dart';
import 'package:squelette_mobile_parcours/pages/ListArticlePage.dart';
import 'package:squelette_mobile_parcours/pages/ListCategoriePage.dart';
import 'package:squelette_mobile_parcours/utils/GlobalColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  int _currentTabIndex = 0;
  Color other = Colors.black;
  Color selectedItem = GlobalColors.orange;

  final pages=[
    EntrepotPage(),
    ListCategoriePage(),
    ListArticlePage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _entete(),
      body:pages[_currentTabIndex],
      bottomNavigationBar: _footer(),);
  }
  AppBar _entete() {
    return AppBar(
      leading: Container(),
      leadingWidth: 0,
      elevation: 0,
      title: Container(height: 50, child: Image.asset("assets/orange.jpg")),
      //Icon(Icons.data_thresholding_rounded, color: GlobalColors.orange, size: 50,),
      //Text("Stock Online",style: TextStyle(color: Colors.black)),elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications,color: Colors.black,),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.person,color: Colors.black,),
        ),
        SizedBox(width: 20)
      ],
    );
  }
  Widget _footer(){
    return BottomNavigationBar(
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: other,
      selectedItemColor: selectedItem,
      items: [
        BottomNavigationBarItem( icon: Icon(Icons.home),label: "Accueil"),
        BottomNavigationBarItem( icon: Icon(Icons.category_outlined), label:"Catégories"),
        BottomNavigationBarItem( icon: Icon(Icons.production_quantity_limits_rounded), label:"Articles"),
        BottomNavigationBarItem( icon: Icon(Icons.settings),label: "Paramètre"),
      ],
      onTap: (int tabIndex) {
        setState(() {
          _currentTabIndex = tabIndex;
        });
      },
    );
  }
}