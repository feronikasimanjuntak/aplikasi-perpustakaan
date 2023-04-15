import 'package:DolokLib/models/book/book_model.dart';
import 'package:DolokLib/screens/details/get/detail_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'product_description.dart';

class Body extends GetWidget<DetailBookController> {
  final BookModel product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductDescription(
          product: product,
          pressOnSeeMore: () {},
        ),
        // ProductImages(product: product),
      ],
    );
  }
}
