import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/ArticleController.dart';
import 'package:squelette_mobile_parcours/Model/ArticleModel.dart';
import 'package:squelette_mobile_parcours/widget/DetailsArticleWidget.dart';

import '../../utils/GlobalColors.dart';
import '../../utils/Routes.dart';

class DetailsArticlePage extends StatefulWidget {
  final ArticleModel article;

  DetailsArticlePage({required this.article});

  @override
  State<DetailsArticlePage> createState() => _DetailsArticlePage();
}

class _DetailsArticlePage extends State<DetailsArticlePage> {
  late ArticleModel _article;

  @override
  void initState() {
    //chargement avant l'execution du builder
    _article = widget.article;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var articleCtrl = context.read<ArticleCtrl>();
      articleCtrl.recupererDataArticles();
    });
  }

  void refreshArticle(ArticleModel newData) {
    _article = newData;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            //_banner(),
            Expanded(
              child: _body(),
            )
          ],
        ),
      ),
      //appBar: _appBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.orange,
      ),
      // changer la couleur ici
      title: Padding(
        padding: EdgeInsets.only(left: 100),
        child: Text("${_article.nomArticle}", style: TextStyle(color: Colors.orange,fontSize: 26),),
      ),
      backgroundColor: Colors.white,

      actions: [],
    );
  }

  Widget _body() {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Container(
          width: 150, child: Center(child: Image.asset("assets/flag.jpg"))),
      SizedBox(
        height: 35,
      ),
      Flexible(
        child: DetailContentWidget(article: _article,refreshArticle:refreshArticle),
      )
    ]);
  }

// Widget _banner() {
//   return Container(
//     width: double.infinity,
//     height: 50,
//     decoration: BoxDecoration(
//       color: Colors.orange.shade800,
//       borderRadius: BorderRadius.only(
//           //topLeft: Radius.circular(10),
//           //topRight: Radius.circular(10),
//           bottomLeft: Radius.circular(50),
//           bottomRight: Radius.circular(50)),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5),
//           spreadRadius: 5,
//           blurRadius: 7,
//           offset: Offset(0, 3), // changes position of shadow
//         ),
//       ],
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(3.0),
//       child: Center(
//         child: Text(
//           "${widget.article.nomArticle}",
//           textAlign: TextAlign.start,
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//       ),
//     ),
//   );
// }
}
