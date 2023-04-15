import 'package:DolokLib/features/book/get/book_binding.dart';
import 'package:DolokLib/features/book/pages/book_page.dart';
import 'package:DolokLib/features/gallery/get/gallery_binding.dart';
import 'package:DolokLib/features/gallery/pages/gallery_page.dart';
import 'package:DolokLib/features/history/get/history_binding.dart';
import 'package:DolokLib/features/history/pages/history_page.dart';
import 'package:DolokLib/screens/complete_profile/get/complete_profile_binding.dart';
import 'package:DolokLib/screens/details/get/detail_book_binding.dart';
import 'package:DolokLib/screens/home/get/home_binding.dart';
import 'package:DolokLib/screens/sign_in/get/sign_in_binding.dart';
import 'package:DolokLib/screens/sign_up/get/sign_up_binding.dart';
import 'package:DolokLib/screens/splash/get/splash_binding.dart';
import 'package:DolokLib/screens/cart/cart_screen.dart';
import 'package:DolokLib/screens/complete_profile/complete_profile_screen.dart';
import 'package:DolokLib/screens/details/details_screen.dart';
import 'package:DolokLib/screens/forgot_password/forgot_password_screen.dart';
import 'package:DolokLib/screens/home/home_screen.dart';
import 'package:DolokLib/screens/profile/profile_screen.dart';
import 'package:DolokLib/screens/sign_in/sign_in_screen.dart';
import 'package:DolokLib/screens/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

import 'screens/sign_up/sign_up_screen.dart';

final appPages = [
  GetPage(
    name: SplashScreen.routeName, 
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: SignInScreen.routeName, 
    page: () => SignInScreen(),
    binding: SignInBinding(),
  ),
  GetPage(
    name: ForgotPasswordScreen.routeName, 
    page: () => ForgotPasswordScreen(),
  ),
  GetPage(
    name: SignUpScreen.routeName, 
    page: () => SignUpScreen(),
    binding: SignUpBinding(),
  ),
  GetPage(
    name: CompleteProfileScreen.routeName, 
    page: () => CompleteProfileScreen(),
    binding: CompleteProfileBinding(),
  ),
  GetPage(
    name: HomeScreen.routeName, 
    page: () => HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: DetailsScreen.routeName, 
    page: () => DetailsScreen(),
    binding: DetailBookBinding(),
  ),
  GetPage(
    name: CartScreen.routeName, 
    page: () => CartScreen(),
  ),
  GetPage(
    name: ProfileScreen.routeName, 
    page: () => ProfileScreen(),
  ),
  GetPage(
    name: BookPage.routeName, 
    page: () => BookPage(),
    binding: BookBinding(),
  ),
  GetPage(
    name: HistoryPage.routeName, 
    page: () => HistoryPage(),
    binding: HistoryBinding(),
  ),
  GetPage(
    name: GalleryPage.routeName, 
    page: () => GalleryPage(),
    binding: GalleryBinding(),
  ),
];
