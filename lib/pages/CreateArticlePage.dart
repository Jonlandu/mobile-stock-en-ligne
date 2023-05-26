import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'dart:convert';
import '../utils/GlobalColors.dart';
class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  void initState() {
    super.initState();
    this.countries.add({"id":1, "label": "josue"});
    this.countries.add({"id":2, "label": "mwembo"});

  }

  Color couleurFont = Colors.black;
  var _value = "-1";
  List<dynamic> countries = ['item1', 'item2', 'item3', 'item5', 'item6'];
  bool isVisible = false;
  var txtDesignation = TextEditingController();
  var txtDescription = TextEditingController();
  var txtschamps = [
    'veuillez selectionner categorie',
    'veuillez selectionner entrepot'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }
  Widget _selectionnerCategorie(){
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
              focusedBorder: _outlineborder(Colors.grey) ,
              focusColor: GlobalColors.greyChamp,
              border: _outlineborder(Colors.grey),
              ),
          value: _value,
          onChanged: (v){},
          items: [
            DropdownMenuItem(child: Text("select categorie",style: TextStyle(fontWeight: FontWeight.bold)),value: "-1",),
            DropdownMenuItem(child: Text("kinshasa",style: TextStyle(fontWeight: FontWeight.bold)),value: "1",),
            DropdownMenuItem(child: Text("paris",style: TextStyle(fontWeight: FontWeight.bold)),value: "2",),
            DropdownMenuItem(child: Text("marseille",style: TextStyle(fontWeight: FontWeight.bold)),value: "3",),
            DropdownMenuItem(child: Text("bordeaux",style: TextStyle(fontWeight: FontWeight.bold)),value: "4",),
          ],
        ),
      ),
    );
  }
  Widget _selectionnerentrepot(){
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            focusedBorder: _outlineborder(Colors.grey) ,
            focusColor: GlobalColors.greyChamp,
            border: _outlineborder(Colors.grey),
          ),
          value: _value,
          onChanged: (v){},
          items: [
            DropdownMenuItem(child: Text("select entrepot",style: TextStyle(fontWeight: FontWeight.bold)),value: "-1",),
            DropdownMenuItem(child: Text("kintambo",style: TextStyle(fontWeight: FontWeight.bold)),value: "1",),
            DropdownMenuItem(child: Text("ndjili",style: TextStyle(fontWeight: FontWeight.bold)),value: "2",),
            DropdownMenuItem(child: Text("masina",style: TextStyle(fontWeight: FontWeight.bold)),value: "3",),
            DropdownMenuItem(child: Text("lemba",style: TextStyle(fontWeight: FontWeight.bold)),value: "4",),
          ],
        ),
      ),
    );
  }
  OutlineInputBorder _outlineborder(MaterialColor _color){
    return OutlineInputBorder(borderRadius: BorderRadius.circular(29),borderSide: BorderSide(width: 2, color: _color));
  }
  AppBar _appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {}, icon: Icon(Icons.arrow_back, color: Colors.black,),),
      title: Text("Creation article", style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
      backgroundColor: Colors.white70,
      elevation: 0,
      actions: [
        SizedBox(
          height: 0,
        )
      ],
    );
  }

  Widget _body() {
    return Stack(
      children: [
        Container(
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
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
                    _champNomarticle(),
                    SizedBox(height: 3,),
                    _champDescription(),
                    SizedBox(height: 3,),
                    _champUnite(),
                    SizedBox(height: 3,),
                    _champStock(),
                    SizedBox(height: 3,),
                    _champStockinitial(),
                    SizedBox(height: 3,),
                    _selectionnerCategorie(),
                    SizedBox(height: 3,),
                    _selectionnerentrepot(),
                    SizedBox(height: 3,),
                    _buttoncreerArticle(),
                  ],
                ),

              ),
            ),
          ),
        )
      ],);
  }

  Widget _champNomarticle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:
      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        // controller: txtDesignation,
        validator: (val) =>
        val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          hintText: "inserer le nom article",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _champDescription() {
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
        val!.isEmpty ? "champ obligatoire" : null,
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

  Widget _champUnite() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:
      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        // controller: txtDesignation,
        validator: (val) =>
        val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          hintText: "inserer l'unite ",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _champStock() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:
      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        // controller: txtDesignation,
        validator: (val) =>
        val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          hintText: "inserer le stock",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _champStockinitial() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:
      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        // controller: txtDesignation,
        validator: (val) =>
        val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          hintText: "inserer le stock initial",
          border: InputBorder.none,
        ),
      ),
    );
  }


  Widget _buttoncreerArticle() {
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
              onPressed: () {}, // => _validerFormulaire(ctx),
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



}

