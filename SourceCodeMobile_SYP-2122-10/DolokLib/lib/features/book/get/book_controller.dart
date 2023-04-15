import 'package:DolokLib/models/book_by_category/book_by_category.dart';
import 'package:DolokLib/repositories/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../models/book/book_model.dart';

class BookController extends GetxController {
  final BookRepository _repository;

  BookController({
    required BookRepository repository,
  }) : _repository = repository;

  final PagingController<int, BookModel> pagingBookController =
      PagingController(firstPageKey: 1);
  final PagingController<int, BookByCategory> pagingBookByCategoryController =
      PagingController(firstPageKey: 1);
  static const _pageSize = 5;
  final _isFilteredByCategory = false.obs;

  bool get isFilteredByCategory => _isFilteredByCategory.value;

  @override
  void onInit() {
    super.onInit();
    final args = retrieveArgs;
    if (args != null) {
      _isFilteredByCategory.value = true;
      pagingBookByCategoryController.addPageRequestListener((pageKey) {
        retrieveBooksByCategory(args, pageKey);
      });
    } else {
      pagingBookController.addPageRequestListener((pageKey) {
        retrieveBooks(pageKey);
      });
    }
  }

  int? get retrieveArgs {
    final args = Get.arguments;
    if (args is int) {
      return args;
    }

    return null;
  }

  void retrieveBooks(int page) async {
    try {
      final newItems = await _repository.list(page);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingBookController.appendLastPage(newItems);
      } else {
        final nextPageKey = page + 1;
        pagingBookController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      debugPrint(error.toString());
      pagingBookController.error = error;
    }
  }

  void retrieveBooksByCategory(int category, int page) async {
    try {
      final newItems = await _repository.byCategory(
        category: category,
        page: page,
      );
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingBookByCategoryController.appendLastPage(newItems);
      } else {
        final nextPageKey = page + 1;
        pagingBookByCategoryController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      debugPrint(error.toString());
      pagingBookController.error = error;
    }
  }

  @override
  void dispose() {
    pagingBookController.dispose();
    pagingBookByCategoryController.dispose();
    super.dispose();
  }
}
