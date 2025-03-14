import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/utils/GlobalColors.dart';
import '../../Controllers/ArticleController.dart';
import '../../Controllers/HomeController.dart';
import '../../utils/Routes.dart';



class ListArticlePage extends StatefulWidget {
  const ListArticlePage({Key? key}) : super(key: key);

  @override
  State<ListArticlePage> createState() => _ListArticlePage();
}

class _ListArticlePage extends State<ListArticlePage> {

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
      body: Column(
        children: [
          _banner(),
          _body(context),
        ],
      ),

      //appBar: _appBar(),
      floatingActionButton: _floatBtn(),

    );
  }

  AppBar _appBar() {
    return AppBar();
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: Column(
            children: [
              _artclContent(context),
            ]),
      ),
    );
  }

  Widget _artclContent(BuildContext ctx) {
    var articlectrl = ctx.watch<ArticleCtrl>();
    print('${articlectrl.articledataList.length}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        // Padding(
        //   padding: EdgeInsets.all(3.0),
        //   child: Container(child: Text(
        //       "Articles:                                                                                     ${articlectrl.articledataList.length}",
        //       style: TextStyle(color: Colors.orange, fontSize: 15,fontWeight: FontWeight.bold))),
        // ),
        SingleChildScrollView(

          child: ListView.builder(

              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: articlectrl.articledataList.length,
              itemBuilder: (ctx, i) {
                var article = articlectrl.articledataList[i];
                return Column(
                  children: [SizedBox(
                    height: 10,
                  ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            //topRight: Radius.circular(10),
                            //bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
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
                      child:
                      TextButton(
                        child: ListTile(
                          leading: Icon(Icons.production_quantity_limits),
                          trailing: Text("${article.solde}""  ${article.unite}",style:TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 16),overflow: TextOverflow.ellipsis,),
                          title: Text(
                            "${article.nomArticle}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black, fontSize: 20,
                            ),

                          ),
                          //trailing: IconButton(onPressed:(){
                          //Navigator.push(context, MaterialPageRoute(builder: (_)=>FormFidelePage(fidele_id: f.id,)));
                          //}, icon:Icon(Icons.arrow_circle_right)),
                          //leading: f.image != null? Image.network("${Constantes.BASE_URL}/${(f.image!)}"):Icon(Icons.error),
                        ),
                        onPressed: () {
                          setState(() {});
                          Navigator.pushNamed(context, Routes.DetailsArticleRoute, arguments: article.toJson());
                          var ctrl = context.read<HomeController>();
                          ctrl.currentTabIndex=2;
                        },
                      ),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }


  Widget _banner(){

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
        padding: const EdgeInsets.all(3.0),
        child: Center(
          child: Text( "Articles", textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
          ),
        ),
      ),
    );

  }
  Widget _floatBtn() {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () async {
        var back = await Navigator.pushNamed(
            context, Routes.CreerArticlesRoute);
        if (back == true) {
          //setState(() {});
        }
      },
      child: Icon(Icons.add),
    );
  }


}
