import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controllers/EntrepotsController.dart';
import '../../Controllers/HomeController.dart';
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
          child: Text( "Entrepots", textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
          ),
        ),
      ),
    );
  }

  Widget _entrepotBloc(){
    var entrepotCtrl = context.watch<EntrepotCtrl>();
    //print('entrepotCtrl.entrepots.length ${entrepotCtrl.entrepots.length}');
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
                decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(15)),
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