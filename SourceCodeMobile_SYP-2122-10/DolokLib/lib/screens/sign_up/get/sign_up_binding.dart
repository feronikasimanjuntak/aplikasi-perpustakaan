import 'package:DolokLib/repositories/auth_repository.dart';
import 'package:DolokLib/screens/sign_up/get/sign_up_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
    Get.put(SignUpController(
      repository: Get.find<AuthRepository>(),
    ));
  }
}
