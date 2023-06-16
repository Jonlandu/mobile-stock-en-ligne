import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/utils/GlobalColors.dart';
import '../Controllers/MouvementController.dart';

class MouvementPage extends StatefulWidget {
  const MouvementPage({Key? key}) : super(key: key);

  @override

  State<MouvementPage> createState() => _MouvementPageState();
}

class _MouvementPageState extends State<MouvementPage> {

  void initState() {
    //chargement avant l'execution du builder
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var mouvementCtrl = context.read<MouvementCtrl>();
      mouvementCtrl.recupererDataMouvement();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: GlobalColors.orange,
          child: _body()),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text("Template"),
      actions: [],
    );
  }
  Widget _body(){
    var mouvementctrl = context.watch<MouvementCtrl>();
    return Stack( children: [
      SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                width:double.infinity,
                height: 50,
                color: GlobalColors.orange,
                //child: Center(child: Image.asset("assets/flag.jpg"))
              ),
              Container(

                  width:double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    color: GlobalColors.greyChamp,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      //bottomLeft: Radius.circular(10),
                      //bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),

                  child:Center(
                    child:
                    Column(

                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          height: 450,
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
                                        title: Text("${mouv.quantite}   ${mouv.typeMouvementId}   ${mouv.motif}  ",
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
                  )
              ),
            ],))
    ],);
  }
}



