import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/ArticleController.dart';
import '../Controllers/HomeController.dart';
import '../Controllers/MouvementController.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var mouvementsCtrl = context.read<MouvementCtrl>();
      mouvementsCtrl.recupererDataMouvementRecent();

      var articlesCtrl = context.read<ArticleCtrl>();
      articlesCtrl.recupererDataArticleRecent();
    });
  }

  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<HomeController>();
    ctrl.currentTabIndex = 0;
    return Scaffold(
      body: Column(
        children: [
          _banner(),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _InfoMouvements(),
                SizedBox(
                  height: 20,
                ),
                _InfoArticles(),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _banner() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange.shade800,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
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
          child: Text(
            "Accueil",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }

  Widget _InfoMouvements() {
    var mouvementsCtrl = context.watch<MouvementCtrl>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
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
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text("Historique créations des mouvements"),
          if (mouvementsCtrl.mouvements.isEmpty)
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Center(child: Text("Aucun mouvement effectué")),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: mouvementsCtrl.mouvements.length,
              itemBuilder: (ctx, i) {
                var MouvementRecentConvert = mouvementsCtrl.mouvements[i];
                var defaultIcon =
                    Icon(Icons.arrow_back_outlined , color: Colors.green);
                if (MouvementRecentConvert.etat == "S") {
                  defaultIcon =
                      Icon(Icons.arrow_forward_outlined, color: Colors.red);
                }
                return ListTile(
                  leading: Icon(Icons.compare_arrows),
                  title: Text("${MouvementRecentConvert.nom_article}"),
                  subtitle: Text("${MouvementRecentConvert.created_at}", style: TextStyle(fontSize: 12),),
                  trailing: Column(children: [
                    defaultIcon,
                    Text(
                        "${MouvementRecentConvert.quantique}  ${MouvementRecentConvert.unite}")
                  ]),
                  onTap: () {},
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
                  onPressed: () {},
                  child: Text(
                    "Voir plus",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ))),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _InfoArticles() {
    var articlesCtrl = context.watch<ArticleCtrl>();
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
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text("Historique créations d'articles"),
          if (articlesCtrl.articledataList.isEmpty)
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Center(child: Text("Aucun article créé")),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: articlesCtrl.articledataList.length,
              itemBuilder: (ctx, i) {
                var ArticleRecentConvert = articlesCtrl.articledataList[i];

                return ListTile(
                  leading: Icon(Icons.production_quantity_limits_rounded),
                  title: Text("${ArticleRecentConvert.nomArticle}"),
                  subtitle: Text("${ArticleRecentConvert.created_at}", style: TextStyle(fontSize: 12),),
                  trailing: Text("${ArticleRecentConvert.solde}  ${ArticleRecentConvert.unite}"),
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
                  onPressed: () {},
                  child: Text(
                    "Voir plus",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ))),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
