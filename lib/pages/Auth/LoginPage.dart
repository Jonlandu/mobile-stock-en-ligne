import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/utils/GlobalColors.dart';
import 'package:squelette_mobile_parcours/utils/RoutesManager.dart';
import 'package:squelette_mobile_parcours/widget/ChargementWidget.dart';

import '../../Controllers/UserController.dart';
import '../../utils/Constantes.dart';
import '../../utils/Routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = false;
  var formkey = GlobalKey<FormState>();
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  bool viewPassword = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Orange Stock",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Login",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        body: Stack(
          children: [
            /*LoginWidget(onDone: () {
              Navigator.pushReplacementNamed(context, Routes.LoadingRoutes);
            }),*/
            Container(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Image.asset("assets/img1.jpg"),
                              ),
                            ],
                          ),
                        ),
                        _champEmail(),
                        _champPassword(),
                        _buttonValidation(),
                        SizedBox(
                          height: 7,
                        ),
                       TextButton(onPressed: () => Navigator.pushNamed(context, Routes.RegisterRoute), child: Text("Vous n'avez pas de compte ?", style: TextStyle(color: Colors.black),)),

                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              height: 100,
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
            ChargementWidget(isVisible)
          ],
        ),
      ),
    );
  }

  Widget _champEmail(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:
      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: txtEmail,
        validator: (val) =>
        val!.isEmpty ? "Adresse email invalide" : null,
        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Colors.black,
          ),
          hintText: "Votre Email",
          border: InputBorder.none,
        ),
      ),
    );
  }
  Widget _champPassword(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding:
      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: GlobalColors.greyChamp),
      child: TextFormField(
        obscureText: true,
        controller: txtPassword,
        validator: (val) =>
        val!.isEmpty ? "Champ obligatoire" : null,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.black,
            ),
            /*suffix: Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),*/
            hintText: "Votre Mot de passe",
            border: InputBorder.none),
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
                "Connexion",
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
    var ctrl = context.read<UserController>();
    Map dataForlogin = {"email": txtEmail.text, "password": txtPassword.text};
    print(dataForlogin);
    var res = await ctrl.login(dataForlogin);
    await Future.delayed(Duration(seconds: 2));
    isVisible = false;
    setState(() {});
    print(res.status);
    if (res.status) {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, Routes.TemplateRoutes);
    } else {
      var msg =
          res.isException == true ? res.errorMsg : (res.data?['message'] ?? "");

      print("mqg=====!!! : $msg");
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
          content: Text('$msg')));
    }
    //Navigator.pushReplacementNamed(context, Routes.LoginRoute);

    // envoie api
    // traitement resultat
    // navigation
  }
}
