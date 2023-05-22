import "package:flutter/material.dart";
import "package:squelette_mobile_parcours/utils/GlobalColors.dart";

import "../utils/Routes.dart";

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override

  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await Future.delayed(Duration(seconds: 5));
      Navigator.pushReplacementNamed(context, Routes.LoginRoute);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/orange.jpg", width: 150, ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Orange  ", style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: GlobalColors.orange
                ),),
                Text("Stock", style: TextStyle(
                  fontSize: 25,
                ),),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            Text("Loading...", style: TextStyle(
              fontSize: 18
            ),)
          ],
        ),

      )
    );
  }
}
