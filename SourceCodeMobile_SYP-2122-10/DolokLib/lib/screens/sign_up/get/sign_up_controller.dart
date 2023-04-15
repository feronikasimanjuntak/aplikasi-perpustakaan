import 'package:DolokLib/models/register_request.dart';
import 'package:DolokLib/repositories/auth_repository.dart';
import 'package:DolokLib/screens/complete_profile/complete_profile_screen.dart';
import 'package:DolokLib/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final AuthRepository _repository;

  SignUpController({
    required AuthRepository repository,
  }) : _repository = repository;

  final formKey = GlobalKey<FormState>();
  final formProfile = GlobalKey<FormState>();

  final _email = Rx<String?>(null);
  final _password = Rx<String?>(null);
  final _firstName = Rx<String?>(null);
  final _lastName = Rx<String?>(null);
  final _phone = Rx<String?>(null);
  final _address = Rx<String?>(null);
  final _confirmPassword = Rx<String?>(null);
  final _remember = false.obs;
  final _errors = Rx<List<String?>>([]);
  final _register = Rx<RegisterRequest?>(null);

  String? get email => _email.value;
  String? get password => _password.value;
  String? get confirmPassword => _confirmPassword.value;
  String? get firstName => _firstName.value;
  String? get lastName => _lastName.value;
  String? get phone => _phone.value;
  String? get address => _address.value;
  bool get remember => _remember.value;
  List<String?> get errors => _errors.value;

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

  void updatePassword(String? value) => _password.value = value;

  void updateConfirmPassword(String? value) => _confirmPassword.value = value;

  void updateEmail(String? email) => _email.value = email;

  void updateFirstName(String? value) => _firstName.value = value;

  void updateLastName(String? value) => _lastName.value = value;

  void updatePhone(String? value) => _phone.value = value;

  void updateAddress(String? value) => _address.value = value;

  void passwordRegister() {
    final register = RegisterRequest(
      name: '-',
      alamat: '-',
      email: _email.value ?? '-',
      password: _password.value ?? '-',
      phone: '-',
    );

    Get.toNamed(CompleteProfileScreen.routeName, arguments: register);
  }

  void register() async {
    final request = RegisterRequest(
      name: firstName ?? _register.value?.name ?? '-',
      alamat: address ?? _register.value?.alamat ?? '-',
      email: email ?? _register.value?.email ?? '-',
      password: password ?? _register.value?.password ?? '-',
      phone: phone ?? _register.value?.phone ?? '-',
    );

    final register = await _repository.register(request);
    if (register != null) Get.offNamed(SignInScreen.routeName);
  }
}
