import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controllers/EntrepotsController.dart';
import '../../Controllers/HomeController.dart';
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
      body: Column(
        children: [
          //SizedBox(height: 20),
          _banner(),
          Expanded(child: _entrepotBloc()),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: _floatBtn(),
            ),
          )
        ],
      ),
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
                    Navigator.pushNamed(context, Routes.DashboardRoute, arguments: EntrepotConvert.toJson());
                  },
                ),
              );
            }
        )
    );
  }

  Widget _floatBtn() {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () async {
        var back = await Navigator.pushNamed(
            context, Routes.CreationEntrepotRoute);
        if (back == true) {
          var ctrl = context.read<HomeController>();
          ctrl.currentTabIndex=0;
          //setState(() {});
        }
      },
      child: Icon(Icons.add),
    );
  }
}