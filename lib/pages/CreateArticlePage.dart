import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/CategorieController.dart';
import 'package:squelette_mobile_parcours/Controllers/EntrepotsController.dart';
import 'package:squelette_mobile_parcours/utils/Routes.dart';
import '../Controllers/ArticleController.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import '../utils/GlobalColors.dart';
import '../../widget/ChargementWidget.dart';
class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);
  @override
  State<ArticlePage> createState() => _ArticlePageState();
}
class _ArticlePageState extends State<ArticlePage> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var entrepotCtrl = context.read<EntrepotCtrl>();
      entrepotCtrl.recuperDataEntrepot();
      var categorieCtrl = context.read<CategorieCtrl>();
      categorieCtrl.recupererDataCategorie();
    });
  }
  Color couleurFont = Colors.black;
  var _value = "-1";
  var listeCategorie = [];
  bool isVisible = false;
  var txtnom_article = TextEditingController();
  var txt_description = TextEditingController();
  var txtunite = TextEditingController();
  var txtstockminimal = TextEditingController();
  var txtstockinitial = TextEditingController();
  var txtschamps = [
    'veuillez selectionner entrepot',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }
  Widget _selectionnerEntrepot() {
    var entrpCat = context.watch<EntrepotCtrl>();
    var renduList = entrpCat.entrepots.map((entrepot) {
      return DropdownMenuItem(
        child: Text("${entrepot.nom}", style: TextStyle(fontWeight: FontWeight.bold)),
        value:  "${entrepot.id}",
      );
    }).toList();
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value.toString();
            });
          },
          items: [
            DropdownMenuItem(
              child: Text("selectionner entrepot",
                  style: TextStyle(fontWeight: FontWeight.normal)),
              value: "-1",
            ),
            ...renduList
         ],
        ),
      ),
    );
  }


  Widget _selectMultipleCategorie() {
    var catCtrl = context.watch<CategorieCtrl>();
    return Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: MultiSelect(
            //--------customization selection modal-----------
              buttonBarColor: Colors.black,
              cancelButtonText: "Quitter",
              titleText: "categories",
              saveButtonColor : GlobalColors.orange,
              cancelButtonColor : GlobalColors.orange,
              checkBoxColor: GlobalColors.orange,
              saveButtonTextColor : Colors.black,
              clearButtonText : "supprimer",
              clearButtonTextColor: Colors.black,
              clearButtonColor : GlobalColors.orange,
              selectedOptionsInfoText: "Selectionner une categorie",
              selectedOptionsBoxColor: GlobalColors.orange,
              selectedOptionsInfoTextColor : Colors.black,
              // autovalidateMode: AutovalidateMode.always,
              maxLength: 10, // optional
              //--------end customization selection modal------------
              validator: (dynamic value) {
                if (value == null) {
                  return 'selectionner au plus une option svp';
                }
                return null;
              },
              errorText: 'selectionner une ou plusieurs categories ',
              dataSource:catCtrl.categoriesList.map((categorie) {
                return {
                  "categorie": categorie.designation,
                  "valeur": categorie.id,
                };
              }).toList(),
              textField: 'categorie',
              valueField: 'valeur',
              filterable: true,
              required: true,
              onSaved: (value) {
                listeCategorie = value;
                print('The saved values are $value');
                print('la liste des items : ${listeCategorie}');
              }),
        ),
        /*change: (value) {
          print('The selected values are $value');
        }*/);
  }

  OutlineInputBorder _outlineborder(MaterialColor _color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(width: 2, color: _color));
  }
  AppBar _appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: Text(
        "Creation article",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
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
                    SizedBox(
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
                    SizedBox(
                      height: 10,
                    ),
                    _champNomarticle(),
                    SizedBox(
                      height: 3,
                    ),
                    _champUnite(),
                    SizedBox(
                      height: 3,
                    ),
                    _champStock(),
                    SizedBox(
                      height: 3,
                    ),
                    _champStockinitial(),
                    SizedBox(
                      height: 3,
                    ),
                    _selectionnerEntrepot(),
                    SizedBox(
                      height: 3,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    _selectMultipleCategorie(),
                    SizedBox(
                      height: 4,
                    ),SizedBox(
                      height: 3,
                    ),
                    _champDescription(),
                    SizedBox(
                      height: 5,
                    ),
                    _buttoncreerArticle(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 320,
                        )),
                    Container(
                      height: 100,
                      child: Image.asset("assets/orange.jpg"),
                    ),
                  ],)
                  ],
                ),
              ),
            ),
          ),
        ),
        ChargementWidget(isVisible)
      ],
    );
  }
  Widget _champNomarticle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        controller: txtnom_article,
        validator: (val) => val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          hintText: "article",
          border: InputBorder.none,
        ),
      ),
    );
  }
  Widget _champDescription() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        maxLines: null,
        maxLength: 1000,
        controller: txt_description,
        validator: (val) => val!.isEmpty ? "champ obligatoire" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.description,
            color: Colors.black,
          ),
          hintText: "description",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _champUnite() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
         controller: txtunite,
        validator: (val) => val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          hintText: "unite ",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _champStock() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        keyboardType: TextInputType.number,
         controller: txtstockminimal,
        validator: (val) => val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          hintText: "stock minimal",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _champStockinitial() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        keyboardType: TextInputType.number,
         controller: txtstockinitial,
        validator: (val) => val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          hintText: "stock initial",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buttoncreerArticle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29), color: GlobalColors.orange),
      height: 50,
      child: Builder(builder: (ctx) {
        return TextButton(
          onPressed: () => _validerFormulaire(ctx),
          child: Text(
            "Creer article",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      }),
    );
  }

  void _validerFormulaire(BuildContext ctx) async{
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {});
    isVisible = true;
    var controller = context.read<ArticleCtrl>();
    String nom_article = txtnom_article.text;
    String description_article = txt_description.text;
    String unite = txtunite.text;
    String stock_minimal = txtstockminimal.text;
    String stock_initial = txtstockinitial.text;
    String id = _value;
    List<dynamic> idcategorie = listeCategorie;
    Map dataForArticle = {
      "nom_article": nom_article,
      "description_article": description_article,
      "unite": unite,
      "stock_minimal": stock_minimal,
      "stock_initial": stock_initial,
      "entrepot_id": id,
      "categorie" : idcategorie
    };

    var response = await controller.articleDataCreate(dataForArticle);
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
    print(response.status);
    if (response.status) {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, Routes.HomeRoute);
    } else {
      var msg =
       response.isException == true ? response.errorMsg : (response.data?['message'] ?? "");
      // print("mqg=====!!! $msg");
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
          content: Text('$msg')

      ));
    }
    isVisible = false;
  }
}
