import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/controllers/CategorieController.dart';
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
  var txtDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back, color: Colors.black,),),
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
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    _champDesignation(),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    _champDescription(),
                    SizedBox(height: 25,),
                    _buttoncreerCategorie(),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: 410,
                            )),
                        Container(
                          height: 120,
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
  Widget _champDescription(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:
      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        maxLines: null,
        maxLength: 1000,
        controller: txtDescription,
        validator: (val) =>
        val!.isEmpty? "champ obligatoire" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.description,
            color: Colors.black,
          ),
          hintText: "inserer description",
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
    int a = 1;
    Map dataForCategorie = {
      "designation": txtDesignation.text,
      "description": txtDescription.text,
      "entrepot_id": a
    };
    print(dataForCategorie);

    var response = await controller.categoriDataCreate(dataForCategorie);
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
     print(response.status);
    if (response.status) {
      await Future.delayed(Duration(seconds: 2));
     Navigator.pushReplacementNamed(context, Routes.CategorieRoute);
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


