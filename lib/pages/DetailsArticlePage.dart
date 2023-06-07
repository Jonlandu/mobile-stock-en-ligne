import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/ArticleController.dart';
import 'package:squelette_mobile_parcours/Model/ArticleModel.dart';
import 'package:squelette_mobile_parcours/widget/DetailsArticleWidget.dart';

import '../utils/GlobalColors.dart';
import '../utils/Routes.dart';



class DetailsArticlePage extends StatefulWidget {
  final ArticleModel article;
  DetailsArticlePage({required this.article});

  @override
  State<DetailsArticlePage> createState() => _DetailsArticlePage();
}
class _DetailsArticlePage extends State<DetailsArticlePage> {

  @override
  void initState() {
    //chargement avant l'execution du builder
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var articleCtrl = context.read<ArticleCtrl>();
      articleCtrl.recupererDataArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      appBar: _appBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(

      iconTheme: IconThemeData(
        color: Colors.orange,),
      // changer la couleur ici
      title: Text("Articles Details",style: TextStyle(color: Colors.orange),),
      backgroundColor: Colors.white,

      actions: [],
    );
  }


  Widget _body() {
    return SingleChildScrollView(
      child: Column(
          children: [
            SizedBox(height: 20,),
            Container(width:250,child: Center(child: Image.asset("assets/flag.jpg"))),
            SizedBox(height: 40,),
            DetailContentWidget(detailsartcl: widget.article),
            SizedBox(
                height: 50),

            _mouvementBtn(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(

                    width:80,child: Image.asset("assets/orange.jpg")),
              ],
            ),
            //_gdtitre(),
            //_catContent(detailsartcl: widget.article),

          ]
      ),
    );

  }

  Widget _mouvementBtn(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:
      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.orange),
      height: 50,
      child: Builder(
          builder: (ctx) {
            return TextButton(
              onPressed: (){
                Navigator.pushNamed(context, Routes.TemplateRoutes);
              },
              child: Text(
                "Operation",
                style:
                TextStyle(color: Colors.black, fontSize: 20),
              ),
            );
          }
      ),
    );
  }

}
