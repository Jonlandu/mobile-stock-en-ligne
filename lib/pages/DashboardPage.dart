import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:squelette_mobile_parcours/Controllers/StatistiqueController.dart";
import "package:squelette_mobile_parcours/utils/GlobalColors.dart";

import "../widget/ChargementWidget.dart";

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isVisible = false;
  int _nbreArticle=0;
  int _nbreCategorie=0;

  void _compteArticle(BuildContext ctx) async {
    isVisible = true;

    setState(() {});

    var ctrl = context.read<StatistiqueController>();

    var res = await ctrl.compteArticle(1);
    _nbreArticle=res?['data'];
    isVisible = false;
    setState(() {});
    print(res);

  }
  void _compteCategorie(BuildContext ctx) async {
    isVisible = true;

    setState(() {});

    var ctrl = context.read<StatistiqueController>();

    var res = await ctrl.compteCategorie(1);
    _nbreCategorie=res?['data'];
    isVisible = false;
    setState(() {});
    print(res);

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _compteArticle(context);
        _compteCategorie(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        surfaceTintColor: Colors.black,
        child: menuLateral(context,),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications, color: Colors.black,),),
          IconButton(onPressed: (){}, icon: Icon(Icons.person, color: Colors.black,),),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [

                Row(
                  children: [
                    Container(

                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      decoration: BoxDecoration(
                        color: GlobalColors.orange,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(100) )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tableau de bord", style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 8,),
                          Text("L'aperçu génerale de l'entrepot", style: TextStyle(
                              fontSize: 15,
                            color: Colors.white

                          ),),
                        ],
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 5000,

                  child: Column(
                    children: [
                      Row(
                        children: [
                          //========== NOMBRE DES PRODUITS==================

                          _nombreProduit(),


                          Container(
                            width: 40,
                          ),
                          _nombreCategorie(),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          _nombreCollaborateur(),
                          Container(
                            width: 40,
                          ),

                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          ChargementWidget(isVisible)
        ],
      ),
    );
  }

  Widget _nombreProduit(){
    return Expanded(child: Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 1),
          )
        ],
      ),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.production_quantity_limits_rounded, size: 35,)),
          Text("Les nombres de produis en stock", style: TextStyle(
            fontSize: 15,
          ),),
          SizedBox(height: 10,),
          Text("$_nbreArticle" , style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold
          ),),
        ],
      ),
    ));
  }


  Widget _nombreCategorie(){
    return Expanded(child: Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 1),
          )
        ],
      ),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.category_outlined, size: 35,)),
          Text("Nombre de categorie de l'entrepot", style: TextStyle(
            fontSize: 15,
          ),),
          SizedBox(height: 10,),
          Text("$_nbreCategorie",style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold
          ),),
        ],
      ),
    ));
  }
  Widget _nombreCollaborateur(){
    return Expanded(child: Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 1),
          )
        ],
      ),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.person, size: 35,)),
          Text("Nombre des collaborateurs ", style: TextStyle(
            fontSize: 15,
          ),),
          SizedBox(height: 10,),
          Text("0",style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold
          ),),
        ],
      ),
    ));
  }
  Widget _nombreEmplacement(){
    return Expanded(child: Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 1),
          )
        ],
      ),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.call_to_action_outlined, size: 35,)),
          Text("Nombre des emplacements ", style: TextStyle(
            fontSize: 15,
          ),),
          SizedBox(height: 10,),
          Text("3",style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold
          ),),
        ],
      ),
    ));
  }

  menuLateral(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: GlobalColors.orange
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Orage Stock Mobile',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
        ),

        ListTile(leading: Icon(Icons.production_quantity_limits_rounded), title: Text('Produits')),
        ListTile(leading: Icon(Icons.category_outlined), title: Text('Categories')),
        ListTile(leading: Icon(Icons.person), title: Text('Collaborateur')),
        ListTile(leading: Icon(Icons.call_to_action_outlined), title: Text('Emplacements')),
      ],
    );
  }


}
