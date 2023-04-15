import 'package:DolokLib/models/book/book_model.dart';
import 'package:DolokLib/models/category/category_model.dart';
import 'package:DolokLib/repositories/auth_repository.dart';
import 'package:DolokLib/repositories/book_repository.dart';
import 'package:DolokLib/repositories/category_repository.dart';
import 'package:DolokLib/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthRepository _authRepository;
  final BookRepository _bookRepository;
  final CategoryRepository _categoryRepository;

  final _categories = Rx<List<CategoryModel>>([]);
  final _books = Rx<List<BookModel>>([]);

  List<CategoryModel> get categories => _categories.value;
  List<BookModel> get books => _books.value;

  HomeController({
    required AuthRepository authRepository,
    required BookRepository bookRepository,
    required CategoryRepository categoryRepository,
  })  : _authRepository = authRepository,
        _bookRepository = bookRepository,
        _categoryRepository = categoryRepository;

  @override
  void onReady() {
    super.onReady();
    retrieveCategories();
    retrieveBooks();
  }

  void logout() async {
    await _authRepository.logout();
    Get.offAllNamed(SplashScreen.routeName);
  }

  void retrieveCategories() async {
    _categories.value = await _categoryRepository.list;
  }

  void retrieveBooks() async {
    _books.value = await _bookRepository.list(1);
  }
}
