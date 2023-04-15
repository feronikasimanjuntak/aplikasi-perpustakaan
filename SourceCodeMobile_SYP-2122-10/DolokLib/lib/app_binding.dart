import 'package:DolokLib/screens/splash/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(
      Dio(BaseOptions(
        baseUrl: 'https://api.perpustakaan.rickaru.com',
      )),
      permanent: true,
    )..interceptors.addAll([
        DioLoggingInterceptor(
          level: Level.body,
        ),
        InterceptorsWrapper(onError: (error, handler) {
          if (error.response?.statusCode == HttpStatus.unauthorized) {
            final local = Get.find<GetStorage>();
            local.erase();
            Get.offAllNamed(SplashScreen.routeName);
          }
          handler.next(error);
        })
      ]);

    Get.put<GetStorage>(GetStorage());
  }
}
