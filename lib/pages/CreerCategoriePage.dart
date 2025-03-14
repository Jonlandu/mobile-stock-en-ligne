import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/CategorieController.dart';
import 'package:squelette_mobile_parcours/Model/CategorieModel.dart';
import 'package:squelette_mobile_parcours/utils/GlobalColors.dart';
import 'package:squelette_mobile_parcours/widget/ChargementWidget.dart';
import '../utils/Routes.dart';
import '../utils/Request.dart';

class CategoriePage extends StatefulWidget {
  const CategoriePage({Key? key}) : super(key: key);

  @override
  State<CategoriePage> createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  Color couleurFont = Colors.black;
  bool isVisible = false;
  var txtDesignation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: IconButton(onPressed: (){
        Navigator.pop(context,true);
      },icon: Icon(Icons.arrow_back, color: Colors.black,),),
      title: Text("Creation categorie", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18),),
      backgroundColor: Colors.white70, elevation: 0,
      actions: [
      ],
    );
  }
  Widget _body(){
    return Stack(
      children: [
        Container(
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset("assets/des.JPG"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    _champDesignation(),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    SizedBox(height: 25,),
                    _buttoncreerCategorie(),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: 390,
                            )),
                        Container(
                          height: 100,
                          child: Image.asset("assets/orange.jpg"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        ChargementWidget(isVisible),
      ],);
  }

  Widget _champDesignation(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:
      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        controller: txtDesignation,
        validator: (val) =>
        val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          hintText: "inserer designation",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buttoncreerCategorie(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:
      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.orange),
      height: 50,
      child: Builder(
          builder: (ctx) {
            return TextButton(
              onPressed: () => _validerFormulaire(ctx),
              child: Text(
                "Creer",
                style:
                TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }
      ),
    );
  }
  void _validerFormulaire(BuildContext ctx) async{
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {});
    isVisible = true;
    var controller = context.read<CategorieCtrl>();
    Map dataForCategorie = {
      "designation": txtDesignation.text,
    };
    print(dataForCategorie);

    var response = await controller.categorieDataCreate(dataForCategorie);
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
     print(response.status);
    if (response.status && response.data?["status"]==true) {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, Routes.HomeRoute);
    } else {
      var msg =
      response.isException == true ? response.errorMsg : (response.data?['message'] ?? "");
      print("mqg=====!!! $msg");
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
          content: Text('$msg')));
    }
    isVisible = false;
  }
}


