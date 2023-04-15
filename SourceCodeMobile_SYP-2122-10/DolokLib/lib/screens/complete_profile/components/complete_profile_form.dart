import 'package:DolokLib/screens/complete_profile/get/complete_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:DolokLib/components/custom_surfix_icon.dart';
import 'package:DolokLib/components/default_button.dart';
import 'package:DolokLib/components/form_error.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends GetWidget<CompleteProfileController> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: controller.errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "daftar",
            press: () {
              if (controller.formKey.currentState!.validate()) {
                controller.save();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => controller.updateAddress(newValue),
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.updateAddress(value);
          controller.removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          controller.addError(error: kAddressNullError);
          return "Alamat Tidak boleh kosong";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Alamat",
        hintText: "Masukkan Alamat Anda ",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => controller.updateName(newValue),
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.updateName(value);
          controller.removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          controller.addError(error: kNamelNullError);
          return "Nama Tidak boleh kosong";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Nama",
        hintText: "Masukkan Nama Anda ",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => controller.updatePhone(newValue),
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.updatePhone(value);
          controller.removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          controller.addError(error: kPhoneNumberNullError);
          return "NO hp Tidak boleh kosong";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "No HP",
        hintText: "Masukkan No Hp Anda",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }
}
