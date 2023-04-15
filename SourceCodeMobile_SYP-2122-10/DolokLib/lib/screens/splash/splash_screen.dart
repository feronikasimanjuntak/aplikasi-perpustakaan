import 'package:DolokLib/screens/splash/get/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:DolokLib/screens/splash/components/body.dart';
import 'package:DolokLib/size_config.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
