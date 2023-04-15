import 'package:DolokLib/models/history/history.dart';
import 'package:DolokLib/repositories/history_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HistoryController extends GetxController {
  final HistoryRepository _repository;

  HistoryController({
    required HistoryRepository repository,
  }) : _repository = repository;

  final PagingController<int, History> pagingController =
      PagingController(firstPageKey: 1);
  static const _pageSize = 5;

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      retrieveHistory(pageKey);
    });
  }

  void retrieveHistory(int page) async {
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

  void borrowExtend(int historyId) async {
    Get.dialog(
      AlertDialog(
        title: Text('Perpanjangan Peminjaman Buku',
            style: Get.textTheme.titleLarge),
        content: Text(
          'Apakah anda yakin akan memperpanjang peminjaman buku ini?',
          style: Get.textTheme.labelLarge,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              final extend = await _repository.extend(historyId);
              if (extend) {
                Get.back();
                Get.showSnackbar(GetSnackBar(
                  message: 'Permintaan Perpanjangan Berhasil Dikirim!',
                  duration: const Duration(seconds: 3),
                ));
                pagingController.refresh();
              } else {
                Get.back();
                Get.showSnackbar(GetSnackBar(
                  message: 'Permintaan Perpanjangan Gagal Dikirim!',
                  duration: const Duration(seconds: 3),
                ));
                pagingController.refresh();
              }
            },
            child: Text('Ya'),
          ),
        ],
      ),
    );
  }

  void borrowReturn(int historyId) async {
    Get.dialog(
      AlertDialog(
        title: Text('Pengembalian Buku', style: Get.textTheme.titleLarge),
        content: Text(
          'Apakah anda yakin akan mengembalikan buku ini?',
          style: Get.textTheme.labelLarge,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              final extend = await _repository.borrowReturn(historyId);
              if (extend) {
                Get.back();
                Get.showSnackbar(GetSnackBar(
                  message: 'Permintaan Pengembalian Buku Berhasil Dikirim!',
                  duration: const Duration(seconds: 3),
                ));
                pagingController.refresh();
              } else {
                Get.back();
                Get.showSnackbar(GetSnackBar(
                  message: 'Permintaan Pengembalian Buku Gagal Dikirim!',
                  duration: const Duration(seconds: 3),
                ));
                pagingController.refresh();
              }
            },
            child: Text('Ya'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
