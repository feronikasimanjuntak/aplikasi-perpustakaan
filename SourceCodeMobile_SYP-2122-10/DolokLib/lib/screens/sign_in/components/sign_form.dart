import 'package:DolokLib/screens/sign_in/get/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:DolokLib/components/custom_surfix_icon.dart';
import 'package:DolokLib/components/form_error.dart';
import 'package:DolokLib/helper/keyboard.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends GetWidget<SignInController> {
  Future<void> launchLink(String url) async {
    await launchUrl(
      Uri.parse(url),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap:(){
                  launchLink('https://perpustakaan.rickaru.com/office/auth/forgot');
                },
                child: Text(
                  "Lupa Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: controller.errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Login",
            press: () {
              if (controller.formKey.currentState!.validate()) {
                controller.formKey.currentState!.save();
                KeyboardUtil.hideKeyboard(context);
                controller.login();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => controller.updatePassword(newValue),
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          controller.removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          controller.addError(error: kPassNullError);
          return "Password Tidak Boleh Kosong";
        } else if (value.length < 8) {
          controller.addError(error: kShortPassError);
          return "Password Tidak boleh kurang dari 8";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Masukkan password anda.....",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => controller.updateEmail(newValue),
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          controller.removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          controller.addError(error: kEmailNullError);
          return "Email Tidak Boleh Kosong";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          controller.addError(error: kInvalidEmailError);
          return "Email anda belum sesuai";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Masukkan email anda...",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
