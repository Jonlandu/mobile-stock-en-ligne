import 'package:flutter/material.dart';

import '../utils/GlobalColors.dart';
import '../widget/ChargementWidget.dart';

class CreationMouvementPage extends StatefulWidget {
  const CreationMouvementPage({Key? key}) : super(key: key);

  @override
  State<CreationMouvementPage> createState() => _CreationMouvementPageState();
}

class _CreationMouvementPageState extends State<CreationMouvementPage> {
  bool isVisible = false;
  var formkey = GlobalKey<FormState>();
  var typeMouvement = "-1";
  var etatMouvement = TextEditingController();
  var quantiteChamp = TextEditingController();
  var MotifChamp = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: entete(),
        body: Column(
          children: [
            Expanded(child: _body()),
          ],
        )
    );
  }

  AppBar entete(){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Créer un mouvement",
        style: TextStyle(color: Colors.black, fontSize: 25),
      ),
    );
  }
  Widget _banner(){
    return Column(
      children: [
        Container(
          width: double.infinity, height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Image.asset("assets/des.JPG")),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          child: Text("NomCategorie || NomArticle", style: TextStyle(fontSize: 20),),
        )
      ],
    );
  }
  Widget _body(){
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              _banner(),
              Container(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      _typeMouvement(),
                      _etatMouvement(),
                      _quantiteChamp(),
                      _MotifChamp(),

                      SizedBox(height: 30),
                      _buttonValidation(),

                      SizedBox(height: 7),

                      Row(
                        children: [
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Container(height: 80, child: Image.asset("assets/orange.jpg"))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ChargementWidget(isVisible)
      ],
    );
  }



  Widget _typeMouvement() {
    var catCtrl = ["Sortie", "Entrée"];
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding:EdgeInsets.symmetric(horizontal: 20),
        width: 340,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(29),
            color: GlobalColors.greyChamp),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: GlobalColors.greyChamp,
            focusColor: GlobalColors.greyChamp,
          ),
          value: typeMouvement,
          onChanged: (value) {
            setState(() { typeMouvement = catCtrl.toString(); });
          },
          items: [
            DropdownMenuItem( child: Text("Type de mouvement", style: TextStyle(color: Colors.black54)), value: "-1"),
            //...renduList
          ],
        ),
      ),
    );
  }
  Widget _etatMouvement() {
    var catCtrl = ["Sortie", "Entrée"];
    /*var renduList = catCtrl.categoriesList.map((categorie) {
      return DropdownMenuItem(
        child: Text("${categorie.designation}", style: TextStyle(fontWeight: FontWeight.bold)),
        value:  "${categorie.id}",
      );
    }).toList();*/
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding:EdgeInsets.symmetric(horizontal: 20),
        width: 340,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(29),
            color: GlobalColors.greyChamp),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: GlobalColors.greyChamp,
            focusColor: GlobalColors.greyChamp,
          ),
          value: typeMouvement,
          onChanged: (value) {
            setState(() { typeMouvement = value.toString(); });
          },
          items: [
            DropdownMenuItem( child: Text("Etat de mouvement", style: TextStyle(color: Colors.black54)), value: "-1"),
            //...renduList
          ],
        ),
      ),
    );
  }
  /*Widget _etatMouvement() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:EdgeInsets.symmetric(horizontal: 20),
      width: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: etatMouvement,
        validator: (val) =>
        val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(icon: Icon(Icons.edit,color: Colors.black45,),
          hintText: "Etat du mouvement",
          border: InputBorder.none,
        ),
      ),
    );
  }*/
  Widget _quantiteChamp() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:EdgeInsets.symmetric(horizontal: 20),
      width: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: quantiteChamp,
        validator: (val) =>
        val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(icon: Icon(Icons.edit,color: Colors.black45,),
          hintText: "Quantité",
          border: InputBorder.none,
        ),
      ),
    );
  }
  Widget _MotifChamp() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:EdgeInsets.symmetric(horizontal: 20),
      width: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        controller: MotifChamp,
        validator: (val) =>
        val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(icon: Icon(Icons.edit,color: Colors.black45,),
          hintText: "Motif du mouvement",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buttonValidation(){
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
              onPressed: () => _validateForm(ctx),
              child: Text(
                "Créer un mouvement",
                style:
                TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }
      ),
    );
  }
  void _validateForm(BuildContext ctx) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (!formkey.currentState!.validate()) {
      return;
    }
    isVisible = true;
  }
}
