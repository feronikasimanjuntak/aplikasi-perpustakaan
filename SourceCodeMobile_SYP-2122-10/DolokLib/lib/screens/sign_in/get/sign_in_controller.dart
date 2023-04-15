import 'package:DolokLib/models/login/login_request.dart';
import 'package:DolokLib/repositories/auth_repository.dart';
import 'package:DolokLib/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final AuthRepository _repository;

  SignInController({
    required AuthRepository repository,
  }) : _repository = repository;

  final formKey = GlobalKey<FormState>();
  final _remember = false.obs;
  final _errors = Rx<List<String?>>([]);
  final _password = Rx<String?>(null);
  final _email = Rx<String?>(null);

  List<String?> get errors => _errors.value;
  bool get remember => _remember.value;
  String? get password => _password.value;
  String? get email => _email.value;

  void addError({String? error}) {
    if (!_errors.value.contains(error)) {
      _errors.value.add(error);
    }
  }

  void removeError({String? error}) {
    if (_errors.value.contains(error)) {
      _errors.value.remove(error);
    }
  }

  void updateRemember(bool value) => _remember.value = value;

  void updatePassword(String? value) => _password.value = value;

  void updateEmail(String? value) => _email.value = value;

  void login() async {
    final login = await _repository.login(LoginRequest(
      email: _email.value ?? '-',
      password: _password.value ?? '-',
    ));

    if(login != null) Get.offAllNamed(HomeScreen.routeName);
  }
}
