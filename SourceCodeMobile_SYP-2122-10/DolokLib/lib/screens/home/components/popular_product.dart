import 'package:DolokLib/features/book/pages/book_page.dart';
import 'package:DolokLib/screens/home/get/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:DolokLib/components/product_card.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Buku", press: ()
            => Get.toNamed(BookPage.routeName)),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Obx((){
          return SizedBox(
            height: 230,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                final book = controller.books[index];
                return ProductCard(
                  product: book,
                );
              },
              itemCount: controller.books.length,
            ),
          );
        }),
      ],
    );
  }
}
