import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/Controllers/EntrepotsController.dart';
import '../../utils/GlobalColors.dart';
import '../../utils/Routes.dart';
import '../../widget/ChargementWidget.dart';

class CreationEntrepotPage extends StatefulWidget {
  const CreationEntrepotPage({Key? key}) : super(key: key);

  @override
  State<CreationEntrepotPage> createState() => _CreationEntrepotPageState();
}

class _CreationEntrepotPageState extends State<CreationEntrepotPage> {
  bool isVisible = false;
  var formkey = GlobalKey<FormState>();
  var entrepotChamp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
        body: Column(
          children: [
            Expanded(child: _body()),
          ],
        ),
    );
  }

  AppBar _appBar(){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,),
      title: Text(
        "Créer un entrepôt",
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
        SizedBox(height: 30),
      ],
    );
  }
  Widget _body(){
    return Stack(
      children: [
        Container(
          child: SingleChildScrollView(
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
                        _nomEntrepotChamp(),

                        SizedBox(height: 30),
                        _buttonValidation(),

                        SizedBox(height: 160),
                        _imgOrange(),

                      ],
                    ),
                  ),
                ),
              ],
            ),
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
  Widget _nomEntrepotChamp() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: entrepotChamp,
        validator: (val) =>
        val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(icon: Icon(Icons.house_siding_outlined,color: Colors.black),
          hintText: "Nom entrepôt",
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
                "Créer un entrepôt",
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
    var ctrl = context.read<EntrepotCtrl>();
    Map dataNewEntrepot = { "nom": entrepotChamp.text };
    print(dataNewEntrepot["nom"]);

    var res = await ctrl.envoieDataEntrepot(dataNewEntrepot);
    await Future.delayed(Duration(seconds: 3));
    isVisible = false;

    setState(() {});
    print(res);

    if (res.status && res.data?["status"]==true) {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pop(context, [true, Routes.EntrepotRoute]);
    }
    else {
      var msg =
      res.isException == true ? res.errorMsg : (res.data?['message'] ?? "");

      print("message=====!!! : $msg");
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
          content: Text('$msg')));
    }


    //Navigator.pop(context, Routes.EntrepotRoute);
  }
}
