import 'package:DolokLib/features/gallery/get/gallery_controller.dart';
import 'package:DolokLib/repositories/gallery_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GalleryRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
    Get.put(GalleryController(
      repository: Get.find<GalleryRepository>(),
    ));
  }
}
