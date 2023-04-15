import 'package:DolokLib/consts/local.dart';
import 'package:DolokLib/screens/home/home_screen.dart';
import 'package:DolokLib/screens/sign_in/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final GetStorage _local;

  SplashController({
    required GetStorage local,
  }) : _local = local;

  final _currentPage = 0.obs;

  List<Map<String, String>> splashData = [
    {
      "text": "Selamat Datang di Perpustakaan Lumban Dolok",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "Kami membantu anda untuk meminjam buku di Perpusatakaan Lumban Dolok",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Kami akan menampilkan kemudahan meminjam buku",
      "image": "assets/images/splash_3.png"
    },
  ];

  bool get hasLogin => _local.read<String?>(token) != null;

  int get currentPage => _currentPage.value;

  void checkHasLogin() {
    if (hasLogin) {
      Get.offAllNamed(HomeScreen.routeName);
    } else {
      Get.toNamed(SignInScreen.routeName);
    }
  }

  void updatePage(int page) => _currentPage.value = page;
}
