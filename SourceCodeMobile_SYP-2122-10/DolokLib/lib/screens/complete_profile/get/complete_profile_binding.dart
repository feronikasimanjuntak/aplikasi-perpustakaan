import 'package:DolokLib/repositories/auth_repository.dart';
import 'package:DolokLib/screens/complete_profile/get/complete_profile_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CompleteProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
    Get.put(CompleteProfileController(
      repository: Get.find<AuthRepository>(),
    ));
  }
}
