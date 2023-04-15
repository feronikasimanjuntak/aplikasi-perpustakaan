import 'package:DolokLib/screens/sign_up/get/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:DolokLib/components/custom_surfix_icon.dart';
import 'package:DolokLib/components/default_button.dart';
import 'package:DolokLib/components/form_error.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends GetWidget<SignUpController> {
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
          buildConformPassFormField(),
          FormError(errors: controller.errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Register",
            press: () {
              if (controller.formKey.currentState!.validate()) {
                controller.formKey.currentState!.save();
                controller.passwordRegister();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => controller.updateConfirmPassword(newValue),
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeError(error: kPassNullError);
        } else if (value.isNotEmpty &&
            controller.password == controller.confirmPassword) {
          controller.removeError(error: kMatchPassError);
        }
        controller.updateConfirmPassword(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          controller.addError(error: kPassNullError);
          return "Konfirmasi Password Tidak boleh kosong";
        } else if ((controller.password != value)) {
          controller.addError(error: kMatchPassError);
          return "Konfirmasi password tidak sama dengan password";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Konfirmasi Password",
        hintText: "Masukkan Konfirmasi Password Anda ...",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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
        controller.updatePassword(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          controller.addError(error: kPassNullError);
          return "Password Tidak boleh kosong";
        } else if (value.length < 8) {
          controller.addError(error: kShortPassError);
          return "Password Tidak boleh kurang dari 8";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Masukkan Password Anda...",
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
          return "Email Tidak boleh kosong";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          controller.addError(error: kInvalidEmailError);
          return "Email format harus benar";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Masukkan Email Anda...",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
