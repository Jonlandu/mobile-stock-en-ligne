import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:squelette_mobile_parcours/utils/GlobalColors.dart';

import '../Model/ArticleModel.dart';
import '../utils/Routes.dart';

class DetailContentWidget extends StatelessWidget {
  ArticleModel detailsartcl;
  DetailContentWidget({required this.detailsartcl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: 500,
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
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "${detailsartcl.nomArticle}",
                  style: TextStyle(color: Colors.black, fontSize: 28,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Stock Minimale : ${detailsartcl.stockMinimal} ${detailsartcl.unite}" ,
                  style: TextStyle(color: Colors.black, fontSize: 22),),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Stock Initiale: ${detailsartcl.stockInitial} ${detailsartcl.unite} ",
                  style: TextStyle(color: Colors.black, fontSize: 22),),
              ),
              SizedBox(height: 40,),
              // Container(
              //   padding: EdgeInsets.only(left: 5),
              //   child: Text(
              //     "Stock Actuel: ${detailsartcl.} ${detailsartcl.unite} ",
              //     style: TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold), ),
              // ),
        SizedBox(height: 120,),
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
                  onPressed: (){
                    Navigator.pushNamed(context, Routes.CreationMovementRoute, arguments: detailsartcl.toJson());
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