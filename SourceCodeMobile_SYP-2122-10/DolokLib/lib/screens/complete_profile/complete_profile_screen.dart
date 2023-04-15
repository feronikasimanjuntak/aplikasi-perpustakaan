import 'package:DolokLib/screens/complete_profile/get/complete_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class CompleteProfileScreen extends GetView<CompleteProfileController> {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lengkapi Registrasi Akun Anda'),
      ),
      body: Body(),
    );
  }
}
