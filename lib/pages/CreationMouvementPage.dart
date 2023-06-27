import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/MouvementController.dart';
import 'package:squelette_mobile_parcours/Controllers/TypeMouvementController.dart';
import 'package:squelette_mobile_parcours/Model/ArticleModel.dart';
import '../utils/GlobalColors.dart';
import '../utils/Routes.dart';
import '../widget/ChargementWidget.dart';

class CreationMouvementPage extends StatefulWidget {
  final ArticleModel article;
  CreationMouvementPage({Key? key, required this.article}) : super(key: key);

  @override
  State<CreationMouvementPage> createState() => _CreationMouvementPageState();
}

class _CreationMouvementPageState extends State<CreationMouvementPage> {
  bool isVisible = false;
  var formkey = GlobalKey<FormState>();
  var typeMouvement=0;
  var quantiteChamp = TextEditingController();
  var MotifChamp = TextEditingController();
  late ArticleModel _article;


  Future<int> _repererArticleId (BuildContext cxt) async {
    var id_article = _article.id ?? 0;
    return id_article;
  }
  @override
  void initState() {
    super.initState();
    _article = widget.article;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _repererArticleId(context);
      var typeMouveCtrl = context.read<TypeMouvementCtrl>();
      typeMouveCtrl.recuperDataTypeMouvement();
    });
  }


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
      iconTheme: IconThemeData(
        color: Colors.black,),
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
          child: Text("${_article.nomArticle}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
              SizedBox(height: 30),
              _banner(),
              Container(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      _typeMouvement(),
                      _quantiteChamp(),
                      _MotifChamp(),

                      SizedBox(height: 30),
                      _buttonValidation(),

                      SizedBox(height: 40),
                      _imgOrange(),

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


  Widget _imgOrange(){
    return Align(
        alignment: Alignment.bottomRight,
        child: Container(height: 80, child: Image.asset("assets/orange.jpg")));
  }
  Widget _typeMouvement() {
    var typeMouveCtrl = context.watch<TypeMouvementCtrl>();
    var renduList = typeMouveCtrl.typeMouvements.map((typeMouvement) {
      return DropdownMenuItem(
        child: Text("${typeMouvement.designation}", style: TextStyle(fontWeight: FontWeight.bold)),
        value:  typeMouvement.id,
      );
    }).toList();
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding:EdgeInsets.symmetric(horizontal: 20),
        width: 340,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(29),
            color: GlobalColors.greyChamp),
        child: DropdownButtonFormField(
          focusColor: GlobalColors.greyChamp,
          decoration: InputDecoration(
            icon: Icon(Icons.compare_arrows,color: Colors.black45,),
            // filled: false,
            // fillColor: GlobalColors.greyChamp,
            // focusColor: GlobalColors.greyChamp,
          ),
          value: typeMouvement,
          onChanged: (value) {
            setState(() { typeMouvement = value!; });
          },
          items: [
            DropdownMenuItem( child: Text("Type de mouvement", style: TextStyle(color: Colors.black54)), value: 0),
           ...renduList
          ],
        ),
      ),
    );
  }
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
        decoration: InputDecoration(icon: Icon(Icons.numbers_outlined,color: Colors.black45,),
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
        decoration: InputDecoration(icon: Icon(Icons.description_outlined,color: Colors.black45,),
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
    setState(() {});

    var ctrl = context.read<MouvementCtrl>();
    Map dataNewMouvement = {
      "type": typeMouvement,
      "quantite": int.parse(quantiteChamp.text),
      "motif":MotifChamp.text,
      "article_id":_article.id
    };

    var res = await ctrl.envoieDataMouvement(dataNewMouvement);
    await Future.delayed(Duration(seconds: 3));
    isVisible = false;

    setState(() {});

    if (res.status && res.data?["status"]==true) {
      await Future.delayed(Duration(seconds: 2));
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 5),
          content: Text('Operation reussie')));
      Navigator.pop(context, [true, Routes.EntrepotRoute]);
    }else{
      var msg =
      res.isException == true ? res.errorMsg : (res.data?['message']);

      print("mqg=====!!! : $msg");
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
          content: Text('$msg')));
    }
  }
}
