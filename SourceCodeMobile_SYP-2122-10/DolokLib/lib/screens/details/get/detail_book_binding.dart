import 'package:DolokLib/repositories/book_repository.dart';
import 'package:DolokLib/screens/details/get/detail_book_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
    Get.put(DetailBookController(
      bookRepository: Get.find<BookRepository>(),
    ));
  }
}
