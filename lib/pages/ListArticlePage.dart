import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controllers/ArticleController.dart';
import '../utils/Routes.dart';



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
      body: _body(context),
      appBar: _appBar(),
      floatingActionButton: _floatBtn(),

    );
  }

  AppBar _appBar() {
    return AppBar(

      leading: SizedBox(),
      leadingWidth: 0,
      title: Container(height: 55, child: Image.asset("assets/orange.jpg"),),
      backgroundColor: Colors.white,

      actions: [
        IconButton(
          onPressed: () {}, icon: Icon(Icons.menu, color: Colors.orange,),),
        SizedBox(width: 5,)
      ],
    );
  }


  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: Column(
            children: [
              _catContent(context),
            ]),
      ),
    );

  }
  Widget _catContent(BuildContext ctx){
    var articlectrl =ctx.watch<ArticleCtrl>();
    print('${articlectrl.articledataList.length}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(child: Text("Nombre des articles: ${articlectrl.articledataList.length}",
              style:TextStyle(color: Colors.orange,fontSize: 15))),
        ),
        SingleChildScrollView(

          child: ListView.builder(

              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: articlectrl.articledataList.length,
              itemBuilder: (ctx,i){
                var articleconvert = articlectrl.articledataList[i];
                return Column(
                  children: [SizedBox(
                    height: 20,
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
                          leading:Image.asset("assets/flag.jpg"),
                          trailing: Icon(Icons.arrow_forward_ios_outlined),
                          title: Row(
                            children: [
                              Column(

                                children: [
                                  Text(
                                    "${articleconvert.nomArticle}  "
                                        "${articleconvert.stockMinimal}  "
                                        "${articleconvert.unite}  ",
                                    style: TextStyle(
                                      color: Colors.black, fontSize: 20,
                                    ),
                                  ),],
                              ),
                            ],
                          ),


                          //trailing: IconButton(onPressed:(){
                          //Navigator.push(context, MaterialPageRoute(builder: (_)=>FormFidelePage(fidele_id: f.id,)));
                          //}, icon:Icon(Icons.arrow_circle_right)),
                          //leading: f.image != null? Image.network("${Constantes.BASE_URL}/${(f.image!)}"):Icon(Icons.error),
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, Routes.DetailsArticleRoute,
                              arguments:articleconvert.toJson()
                          );


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

  Widget _floatBtn(){
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () async {
        var back = await Navigator.pushNamed(
            context, Routes.ArticlesRoute);
        if (back == true) {
          //setState(() {});
        }
      },
      child: Icon(Icons.add),
    );
  }

}
