import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/ArticleController.dart';
import 'package:squelette_mobile_parcours/utils/Routes.dart';

import '../Controllers/HomeController.dart';
import '../Controllers/MouvementController.dart';
import '../Model/ArticleModel.dart';

class AccueilPage extends StatefulWidget {
  // final  ArticleModel? article;
  const AccueilPage({Key? key}) : super(key: key);


  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  // late ArticleModel? _article;

  // Future<String> _repererNomArticle (BuildContext cxt) async {
  //   var articleNom = _article?.nomArticle ?? "";
  //   return articleNom;
  // }

  @override
  void initState() {

    super.initState();
    // _article = widget.article;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var mouvementCtrl = context.read<MouvementCtrl>();
      // _repererNomArticle(context);
      // var articlCtrl = context.read<ArticleCtrl>();
      // if(_article == null){
      //   mouvementCtrl.recupererDataMouvement();
      // }else{
      //   articlCtrl.recupererDataArticles();
      // }

    });
  }

  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<HomeController>();
    ctrl.currentTabIndex=0;
    return Scaffold(
      body: Column(
        children: [
          //SizedBox(height: 20),
          _banner(),
          SizedBox(height: 20,),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _InfoMouvements(),
                  ],
                ),
              )
          ),
        ],
      ),
    );
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
          child: Text( "Accueil", textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
          ),
        ),
      ),
    );
  }


  Widget _InfoMouvements(){
    var mouvementctrl = context.watch<MouvementCtrl>();
    // print("data ====== ${entrepotCtrl.entrepots}");
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 1),
          )
        ],
      ),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          if (mouvementctrl.mouvements.isEmpty) Container(
            margin:EdgeInsets.symmetric(vertical: 50),
            child: Center(
                child: Text("Aucun mouvement effectué")
            ),
          ) else ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: mouvementctrl.mouvements.length,
            itemBuilder: (ctx, i){
              var MouvementConvert = mouvementctrl.mouvements[i];
              print("===================== ${MouvementConvert.id}");
              return ListTile(
                leading: Icon(Icons.compare_arrows),
                title : Text("${MouvementConvert.id}"),
                // if(MouvementConvert.typeMouvementId == 1){
                //   trailing: Icon(Icons.arrow_forward_outlined, color: Colors.green),
                // }else{
                //   trailing: Icon(Icons.arrow_back_outlined, color: Colors.red),
                // },
                subtitle : Text("Solde :${MouvementConvert.id}"),
                onTap: (){},
              );
            },
          ),

          Container(
              height: 30,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black87,
              ),
              child: TextButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, Routes.HomeRoute);
                  },
                  child: Text("Voir plus", style: TextStyle(color: Colors.white, fontSize: 12),)
              )
          ),

          SizedBox(height: 8),
        ],
      ),
    );
  }
  // Widget _InfoEntrepots(){
  //   var entrepotCtrl = context.watch<EntrepotCtrl>();
  //   // print("data ====== ${entrepotCtrl.entrepots}");
  //   return ExpansionTile(
  //     title: Text("Entrepots"),
  //     trailing: Icon(Icons.arrow_drop_down_circle),
  //     children: [
  //       Container(
  //         color: Colors.black38,
  //           width: double.infinity,
  //           alignment: Alignment.center,
  //           padding: EdgeInsets.symmetric(vertical: 5),
  //           child: Text("Dernières créations d'entrepots",
  //               style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18))),
  //
  //       entrepotCtrl.entrepots.isEmpty ? Center(child: Text("Aucun entrepot trouvé")): ListView.builder(
  //         shrinkWrap: true,
  //         scrollDirection: Axis.vertical,
  //         itemCount: entrepotCtrl.entrepots.length,
  //         itemBuilder: (ctx, i){
  //           var EntrepotConvert = entrepotCtrl.entrepots[i];
  //           return ListTile(
  //             leading: Icon(Icons.store_outlined),
  //             title : Text("${EntrepotConvert.nom}"),
  //             subtitle : Text("${EntrepotConvert.createdAt}"),
  //             onTap: (){},
  //           );
  //         },
  //       ),
  //
  //       Container(
  //         height: 30,
  //           width: 130,
  //           decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(25),
  //           color: Colors.black87,
  //         ),
  //         child: TextButton(
  //             onPressed: (){
  //               Navigator.pushReplacementNamed(context, Routes.HomeRoute);
  //             },
  //             child: Text("Voir plus", style: TextStyle(color: Colors.white, fontSize: 12),)
  //         )
  //       ),
  //
  //       SizedBox(height: 8),
  //     ],
  //   );
  // }

}
