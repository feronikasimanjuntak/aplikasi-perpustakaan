import 'package:DolokLib/features/history/get/history_controller.dart';
import 'package:DolokLib/features/history/widgets/history_item.dart';
import 'package:DolokLib/models/history/history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({Key? key}) : super(key: key);

  static const routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Peminjaman', style: Get.textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: PagedListView<int, History>(
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<History>(
            itemBuilder: (context, item, index) => HistoryItem(
              history: item,
            ),
          ),
        ),
      ),
    );
  }
}