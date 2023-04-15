import 'package:DolokLib/repositories/auth_repository.dart';
import 'package:DolokLib/screens/sign_in/get/sign_in_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
    Get.put(SignInController(
      repository: Get.find<AuthRepository>(),
    ));
  }
}
