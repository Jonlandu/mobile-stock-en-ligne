import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/CategorieController.dart';
import 'package:squelette_mobile_parcours/utils/Routes.dart';

class ListCategoriePage extends StatefulWidget {
  const ListCategoriePage({Key? key}) : super(key: key);

  @override
  State<ListCategoriePage> createState() => _ListCategoriePageState();
}

class _ListCategoriePageState extends State<ListCategoriePage> {

  @override
  void initState() {
    //chargement avant l'execution du builder
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var categorieCtrl = context.read<CategorieCtrl>();
      categorieCtrl.recupererDataCategorie();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          //SizedBox(height: 20),
          _banner(),
          Expanded(child: _categorieContent()),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () async {
                  var retoure = await Navigator.pushNamed(context, Routes.CategorieRoute);
                  if (retoure == true){
                    setState(() {});
                  }
                },
                child: Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: Container(),
      leadingWidth: 0,
      title: Container(height: 50, child: Image.asset("assets/orange.jpg")),
      //Icon(Icons.data_thresholding_rounded, color: GlobalColors.orange, size: 50,),
      //Text("Stock Online",style: TextStyle(color: Colors.black)),elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.black, size: 30),),
        SizedBox(width: 20)
      ],
    );
  }
  Widget _banner(){
    // var entrepotCtrl = context.watch<Entrepot_Ctrl>();
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text( "Liste des Categories", textAlign: TextAlign.start,
          style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 25),
        ),
      ),
    );
  }

  Widget _categorieContent(){
    var categoriectrl = context.watch<CategorieCtrl>();
    print('${categoriectrl.categoriesList.length}');
    return ListView(
        children:[ ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount:categoriectrl.categoriesList.length,
            itemBuilder: (ctx,i) {
              var categorieconvert = categoriectrl.categoriesList[i];

              return Column(

                children: [
                  ListTile(
                      leading: Icon(Icons.shopping_cart),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      title: Text("${categorieconvert.designation}",
                        style: TextStyle(color: Colors.black, fontSize: 22),),
                      subtitle: Text("${categorieconvert.description}",
                        style: TextStyle(color: Colors.black, fontSize: 16),)),
                ],
              );
            }
        ),]

    );
  }
}


