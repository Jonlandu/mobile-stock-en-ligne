import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/utils/GlobalColors.dart';

import '../Controllers/ArticleController.dart';
import '../Model/ArticleModel.dart';
import '../utils/Routes.dart';

class DetailContentWidget extends StatelessWidget {
  ArticleModel article;
  Function(ArticleModel) refreshArticle;


  DetailContentWidget({required  this.article, required this.refreshArticle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          // height: 340,
          decoration: BoxDecoration(
            color: GlobalColors.greyChamp,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Container(
              //   padding: EdgeInsets.only(left: 5),
              //   child: Text(
              //     "${article.nomArticle}",
              //     style: TextStyle(color: Colors.black, fontSize: 28,fontWeight: FontWeight.bold),),
              // ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Stock Minimale : ${article.stockMinimal} ${article.unite}" ,
                  style: TextStyle(color: Colors.black, fontSize: 22),),
              ),
              Container(

                padding: EdgeInsets.only(left: 5),

                child: Text(
                  "Stock Initiale: ${article.stockInitial} ${article.unite} ",
                  style: TextStyle(color: Colors.black, fontSize: 22),),

              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Stock Actuel: ${article.solde} ${article.unite} ",
                  style: TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold), ),
              ),
              SizedBox(height: 180,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10,),
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
                        onPressed: ()async{
                          var res = await Navigator.pushNamed(context, Routes.CreationMovementRoute, arguments: article.toJson());
                          if(res!=null){
                            var ctrl= ctx.read<ArticleCtrl>();
                            await ctrl.recupererDataArticles();
                            var newArtilces=ctrl.articledataList;
                            var articleSearch=newArtilces.where((e) => e.id == article.id).toList();
                            if(articleSearch.isNotEmpty){
                              var newArticle=articleSearch[0];
                              refreshArticle(newArticle);
                            }
                          }
                        },


                        child: Text(
                          "Operation",
                          style:
                          TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      );
                    }
                ),
              ), ],
          ),
        ),
      ),
    );


  }

}