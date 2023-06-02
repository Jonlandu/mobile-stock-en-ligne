import 'package:flutter/material.dart';
import 'apps/MonApplication.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

 /* ErrorWidget.builder = (FlutterErrorDetails details) {
=======
    ErrorWidget.builder = (FlutterErrorDetails details) {
>>>>>>> d5cdd29e8f8b9b5f6a1567ebeb97ecc39570cda1
    print(details.stack);
    return Scaffold(
      body: Center(
        child: Text("Erreur inattendue"),
      ),
    );
  };*/
  runApp(MonApplication());
}
