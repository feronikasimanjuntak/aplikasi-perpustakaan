import 'package:DolokLib/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:DolokLib/routes.dart';
import 'package:DolokLib/screens/splash/splash_screen.dart';
import 'package:DolokLib/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lumban Dolok Library',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      getPages: appPages,
      initialBinding: AppBinding(),
    );
  }
}
