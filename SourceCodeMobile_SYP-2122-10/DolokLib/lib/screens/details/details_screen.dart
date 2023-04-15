import 'package:DolokLib/models/book/book_model.dart';
import 'package:DolokLib/models/book_by_category/book_by_category.dart';
import 'package:DolokLib/screens/details/components/product_description.dart';
import 'package:DolokLib/screens/details/get/detail_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/default_button.dart';

class DetailsScreen extends GetView<DetailBookController> {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        title: Text('Detail Buku', style: Get.textTheme.titleLarge),
      ),
      body: ProductDescription(
        productByCategory: controller.args.productByCategory,
        product: controller.args.product,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: DefaultButton(
          text: "Pinjam",
          press: () => Get.dialog(
            AlertDialog(
              title: Text('Peminjaman Buku', style: Get.textTheme.titleLarge),
              content: Text(
                'Masa peminjaman buku ini adalah seminggu dari hari ini, Apakah anda setuju?',
                style: Get.textTheme.labelLarge,
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text('Batal'),
                ),
                TextButton(
                  onPressed: () => controller.borrow(
                    agrs.product?.id ?? 
                    agrs.productByCategory?.id ?? 
                    -1,
                  ),
                  child: Text('Ya'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final BookModel? product;
  final BookByCategory? productByCategory;

  ProductDetailsArguments({
    this.product,
    this.productByCategory,
  });
}
