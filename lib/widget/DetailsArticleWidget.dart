import 'package:flutter/material.dart';

import '../Model/ArticleModel.dart';

class DetailContentWidget extends StatelessWidget {
  ArticleModel detailsartcl;
  DetailContentWidget({required this.detailsartcl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Produit: ${detailsartcl.nomArticle}",
              style: TextStyle(color: Colors.black, fontSize: 28,fontWeight: FontWeight.bold),),
          ),
          Container(
            child: Text(
              "Stock Minimale : ${detailsartcl.stockMinimal} ${detailsartcl.unite}" ,
              style: TextStyle(color: Colors.black, fontSize: 22),),
          ),
          Container(
            child: Text(
              "Stock Initiale: ${detailsartcl.stockInitial} ${detailsartcl.unite} ",
              style: TextStyle(color: Colors.black, fontSize: 22),),
          ),
          //subtitle: Text("${detailsartcl.descriptionArticle}  ",
          //style: TextStyle(color: Colors.black, fontSize: 18),),
          //);
        ],
      ),
    );
  }
}