import 'package:DolokLib/screens/home/get/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'search_field.dart';

class HomeHeader extends GetWidget<HomeController> {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.grey.shade500),
            onPressed: () => controller.logout(),
          ),
        ],
      ),
    );
  }
}
