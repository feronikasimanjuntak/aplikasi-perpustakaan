import 'package:DolokLib/repositories/auth_repository.dart';
import 'package:DolokLib/repositories/book_repository.dart';
import 'package:DolokLib/repositories/category_repository.dart';
import 'package:DolokLib/screens/home/get/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
    Get.put(BookRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
    Get.put(CategoryRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
    
    Get.put(HomeController(
      authRepository: Get.find<AuthRepository>(),
      bookRepository: Get.find<BookRepository>(),
      categoryRepository: Get.find<CategoryRepository>(),
    ));
  }
}
