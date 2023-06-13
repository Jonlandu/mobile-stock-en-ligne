import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/CategorieController.dart';
import 'package:squelette_mobile_parcours/utils/Routes.dart';

import '../Controllers/HomeController.dart';

class ListCategoriePage extends StatefulWidget {
  const ListCategoriePage({Key? key}) : super(key: key);

  @override
  State<ListCategoriePage> createState() => _ListCategoriePageState();
}

class _ListCategoriePageState extends State<ListCategoriePage> {


  @override
  void initState() {
    //chargement avant l'execution du builder
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var categorieCtrl = context.read<CategorieCtrl>();
      categorieCtrl.recupererDataCategorie();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //SizedBox(height: 20),
          _banner(),
          Expanded(child: _categorieContent()),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              ),
            ),
        ],
      ),
      floatingActionButton: _floatBtn(),
    );
  }

  AppBar _appBar() {
    return AppBar();
  }
  Widget _banner(){
    // var entrepotCtrl = context.watch<Entrepot_Ctrl>();
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange.shade800,
        borderRadius: BorderRadius.only(
          //topLeft: Radius.circular(10),
          //topRight: Radius.circular(10),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text( "Categories", textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
          ),
        ),
      ),
    );

  }

  Widget _categorieContent(){
    var categoriectrl = context.watch<CategorieCtrl>();
    print('${categoriectrl.categoriesList.length}');
    return ListView(
      padding: EdgeInsets.all(8.0),
        children:[ ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount:categoriectrl.categoriesList.length,
            itemBuilder: (ctx,i) {
              var categorieconvert = categoriectrl.categoriesList[i];

              return Column(
                children: [SizedBox(
                  height: 20,
                ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        //topLeft: Radius.circular(10),
                        topRight: Radius.circular(50),
                          //bottomLeft: Radius.circular(1.0),
                          bottomRight: Radius.circular(50)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListTile(
                        //leading: Icon(Icons.shopping_cart),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                        title: Text("${categorieconvert.designation}",
                          style: TextStyle(color: Colors.black, fontSize: 22),),),
                  ),
                ],
              );
            }
        ),]

    );
  }

  Widget _floatBtn(){
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () async {
        var back = await Navigator.pushNamed(
            context, Routes.ListCategorieRoute);
        if (back == true) {
          var ctrl = context.read<HomeController>();
          ctrl.currentTabIndex=1;
          //setState(() {});
        }
      },
      child: Icon(Icons.add),
    );
  }

}


