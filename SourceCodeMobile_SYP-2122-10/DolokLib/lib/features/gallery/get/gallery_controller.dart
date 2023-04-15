import 'package:DolokLib/models/gallery/gallery.dart';
import 'package:DolokLib/repositories/gallery_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


class GalleryController extends GetxController {
  final GalleryRepository _repository;

  GalleryController({
    required GalleryRepository repository,
  }) : _repository = repository;

  final PagingController<int, Gallery> pagingController =
      PagingController(firstPageKey: 1);
  static const _pageSize = 5;

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      retrieveGallery(pageKey);
    });
  }

  void retrieveGallery(int page) async {
    try {
      final newItems = await _repository.list(page);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      debugPrint(error.toString());
      pagingController.error = error;
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
