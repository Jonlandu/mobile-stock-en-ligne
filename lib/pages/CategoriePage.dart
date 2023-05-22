import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/utils/GlobalColors.dart';

class CategoriePage extends StatefulWidget {
  const CategoriePage({Key? key}) : super(key: key);

  @override
  State<CategoriePage> createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  Color couleurFont = Colors.black;
   var txts = ["Designation","Description"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back, color: Colors.black,),),
      title: Text("Créer une categorie", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18),),
      backgroundColor: Colors.transparent, elevation: 0,
      actions: [
      ],
    );
  }
  Widget _body(){
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child : Stack( children : [
      SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          _texts(txts[0]),
          SizedBox(height: 10,),
          _champDesignation(),
          SizedBox(height: 10,),
          _texts(txts[1]),
          SizedBox(height: 10,),
          _champDescription(),
          SizedBox(height: 25,),
          _validatenwidget(),
        ],
      ))
        ]
      ));
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
  OutlineInputBorder _outlineborder(MaterialColor _color){
    return OutlineInputBorder(borderRadius : BorderRadius.circular(15), borderSide: BorderSide(width: 2, color: _color));
  }
  Text _texts(_txt)
  {
    return Text(_txt,textAlign: TextAlign.left,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,));
  }
  Widget _validatenwidget(){
    return Container(width: 400, child: ElevatedButton(onPressed: (){
      setState(() { // reinitialiser les parametres pour un changement
      });
    }, child: Text('creer'),style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),));
  }
}


