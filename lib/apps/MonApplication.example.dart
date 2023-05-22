import 'package:flutter/material.dart';
import '../utils/Routes.example.dart';
import '../utils/RoutesManager.example.dart';




class MonApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.route,
      initialRoute: Routes.TemplateRoutes,
    );
  }
}
