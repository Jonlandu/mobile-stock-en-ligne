import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controllers/EntrepotsController.dart';
import '../../utils/GlobalColors.dart';
import '../../utils/Routes.dart';

class EntrepotPage extends StatefulWidget {
  const EntrepotPage({Key? key}) : super(key : key);

  @override
  State<EntrepotPage> createState() => EntrepotPageState();
}

class EntrepotPageState extends State<EntrepotPage> {

  @override
  void initState() {

    super.initState();
    //chargement des donnees
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var entrepotCtrl = context.read<EntrepotCtrl>();
      entrepotCtrl.recuperDataEntrepot();
      //print(entrepotCtrl.entrepots);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: entete(),
      body: Column(
        children: [
          //SizedBox(height: 20),
          _banner(),
          Expanded(child: _entrepotBloc()),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () async {
                  var retoure = await Navigator.pushNamed(context, Routes.CreationEntrepotRoute);
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

  AppBar entete() {
    return AppBar(
      leading: Container(),
      leadingWidth: 0,
      title: Container(height: 50, child: Image.asset("assets/orange.jpg")),
      //Icon(Icons.data_thresholding_rounded, color: GlobalColors.orange, size: 50,),
      //Text("Stock Online",style: TextStyle(color: Colors.black)),elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.person_3, color: Colors.black, size: 30),),
        IconButton(onPressed: (){
          Navigator.pushNamed(context, Routes.CreationMovementRoute);
        }, icon: Icon(Icons.add, color: Colors.black, size: 30)),
        SizedBox(width: 20)
      ],
    );
  }

  Widget _banner(){
   // var entrepotCtrl = context.watch<Entrepot_Ctrl>();
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text( "Entrepôts", textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
        ),
      ),
    );
  }

  Widget _entrepotBloc(){
    var entrepotCtrl = context.watch<EntrepotCtrl>();
    print('entrepotCtrl.entrepots.length ${entrepotCtrl.entrepots.length}');
    return  Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: entrepotCtrl.entrepots.length,
            itemBuilder: (ctx, i){
              var EntrepotConvert = entrepotCtrl.entrepots[i];
              return Container(
                padding: const EdgeInsets.all(4.0),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: GlobalColors.orange, borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                  child: ListTile(
                    title : Text("${EntrepotConvert.nom}", style: TextStyle(color: Colors.white, fontSize: 20),),
                    subtitle : Text("${EntrepotConvert.createdAt}", style: TextStyle(color: Colors.white),),
                    trailing : Icon(Icons.double_arrow_sharp, color: Colors.white,),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, Routes.TemplateRoutes, arguments: EntrepotConvert.toJson());
                  },
                ),
              );
            }
        )
    );
  }
}