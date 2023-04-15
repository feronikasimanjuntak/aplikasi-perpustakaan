import 'package:DolokLib/screens/home/get/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:DolokLib/components/coustom_bottom_nav_bar.dart';
import 'package:DolokLib/enums.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class HomeScreen extends GetView<HomeController> {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
        onLogoutPressed: () => controller.logout(),
      ),
    );
  }
}
