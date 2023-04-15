import 'package:DolokLib/repositories/auth_repository.dart';
import 'package:DolokLib/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/register_request.dart';
import '../../sign_in/sign_in_screen.dart';

class CompleteProfileController extends GetxController {
  final AuthRepository _repository;

  CompleteProfileController({
    required AuthRepository repository,
  }) : _repository = repository;

  final formKey = GlobalKey<FormState>();

  final _register = Rx<RegisterRequest?>(null);
  final _errors = Rx<List<String?>>([]);
  final _phone = Rx<String?>(null);
  final _name = Rx<String?>(null);
  final _address = Rx<String?>(null);

  RegisterRequest? get register => _register.value;
  List<String?> get errors => _errors.value;
  String? get phone => _phone.value;
  String? get name => _name.value;
  String? get address => _address.value;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      _errors.value.add(error);
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      _errors.value.remove(error);
    }
  }

  @override
  void onInit() {
    super.onInit();
    retrieveArgs();
  }

  void retrieveArgs() {
    final args = Get.arguments;
    if (args is RegisterRequest) {
      _register.value = args;
    }
  }

  void updatePhone(String? value) => _phone.value = value;

  void updateAddress(String? value) => _address.value = value;

  void updateName(String? value) => _name.value = value;

  void save() async {
    final request = RegisterRequest(
      name: _name.value ?? '-',
      alamat: _address.value ?? '-',
      email: _register.value?.email ?? '-',
      password: _register.value?.password ?? '-',
      phone: _phone.value ?? '-',
    );

    final register = await _repository.register(request);
    if (register != null){
      Get.offNamedUntil(SignInScreen.routeName,
        (route) => route.settings.name == SplashScreen.routeName,
      );
    }
  }
}
