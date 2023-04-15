import 'package:DolokLib/components/product_card_category.dart';
import 'package:DolokLib/features/book/get/book_controller.dart';
import 'package:DolokLib/models/book_by_category/book_by_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../components/product_card.dart';
import '../../../models/book/book_model.dart';

class BookPage extends GetView<BookController> {
  const BookPage({Key? key}) : super(key: key);

  static const routeName = '/all-books';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kumpulan Buku', style: Get.textTheme.titleLarge),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: (controller.isFilteredByCategory)
            ? byCategoryList(context)
            : list(context)
        );
      }),
    );
  }

  Widget byCategoryList(BuildContext context) {
    return PagedGridView<int, BookByCategory>(
      pagingController: controller.pagingBookByCategoryController,
      builderDelegate: PagedChildBuilderDelegate<BookByCategory>(
        itemBuilder: (context, item, index) => ProductCardCategory(
          product: item,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 6,
        childAspectRatio: 0.5,
      ),
    );
  }

  Widget list(BuildContext context) {
    return PagedGridView<int, BookModel>(
      pagingController: controller.pagingBookController,
      builderDelegate: PagedChildBuilderDelegate<BookModel>(
        itemBuilder: (context, item, index) => ProductCard(
          product: item,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 6,
        childAspectRatio: 0.5,
      ),
    );
  }
}
