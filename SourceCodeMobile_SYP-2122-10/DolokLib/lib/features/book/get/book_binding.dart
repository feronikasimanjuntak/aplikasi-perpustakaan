import 'package:DolokLib/features/book/get/book_controller.dart';
import 'package:DolokLib/repositories/book_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BookBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
    Get.put(BookController(
      repository: Get.find<BookRepository>(),
    ));
  }
}
