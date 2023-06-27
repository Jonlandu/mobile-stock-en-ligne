import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/ArticleController.dart';
import 'package:squelette_mobile_parcours/Controllers/HomeController.dart';
import 'package:squelette_mobile_parcours/utils/GlobalColors.dart';
import '../../Controllers/MouvementController.dart';
import '../../Model/ArticleModel.dart';

class MouvementPage extends StatefulWidget {
  final ArticleModel? article;
  MouvementPage({Key? key,  this.article}) : super(key: key);

  @override

  State<MouvementPage> createState() => _MouvementPageState();
}

class _MouvementPageState extends State<MouvementPage> {
  ArticleModel? _article;
  Future<String> _recupNomArticle(BuildContext ctx) async{

    var articleNom=_article?.nomArticle ?? "";
    print("${_article}");
    return articleNom;
  }
  void initState() {
    super.initState();
    _article=widget.article;
    //chargement avant l'execution du builder
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _recupNomArticle(context);
      var mouvementCtrl = context.read<MouvementCtrl>();
      //var articlectrl=context.read<ArticleCtrl>();
      if(_article==null){
        //recuperer tous les mvts
        mouvementCtrl.recupererDataMouvement();

      }else{
        //var articlectrl=context.watch<ArticleCtrl>();
        //articlectrl.recupererDataArticles();
        //recupere les mvts par article
      }
    });
    return print("article : ${_article?.nomArticle}");
  }
  @override
  Widget build(BuildContext context) {
    // var ctrl=context.watch<HomeController>();
    // ctrl.currentTabIndex=4;
    return Scaffold(
      body: Column(
        children: [
          _banner(),
          SizedBox(height: 10 ,),
          _body(context),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text("Template"),
      actions: [],
    );
  }
  Widget _body(BuildContext context){
    var mouvementctrl = context.watch<MouvementCtrl>();
    print("nom de l'article Joueeeeeee: ${widget.article?.nomArticle}");
    return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Center(
              child:
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(3),
                    width: double.infinity,
                    height: 477,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: mouvementctrl.mouvements.length,
                        itemBuilder: (ctx,i){
                          var mouv=mouvementctrl.mouvements[i];
                          return Column(
                            children: [
                              Container(
                                  child: ListTile(
                                    leading:Icon(Icons.compare_arrows),
                                    title: Text("${mouv.quantite}   ${widget.article?.nomArticle}   ${mouv.motif}  ",
                                      style: TextStyle(color: Colors.black, fontSize: 22),),
                                    subtitle: Text("${mouv.createdAt}"),
                                  )
                              ),

                            ],
                          );
                        }),
                  )

                ],
              ),
            ),
          ],));
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
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text( "Historique", textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
          ),
        ),
      ),
    );

  }
}



