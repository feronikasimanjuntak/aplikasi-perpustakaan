import 'package:DolokLib/features/history/get/history_controller.dart';
import 'package:DolokLib/repositories/history_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HistoryRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));

    Get.put(HistoryController(repository: Get.find<HistoryRepository>()));
  }
}
