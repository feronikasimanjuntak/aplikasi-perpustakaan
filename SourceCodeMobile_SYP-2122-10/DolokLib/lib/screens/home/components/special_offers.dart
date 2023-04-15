import 'package:DolokLib/features/book/pages/book_page.dart';
import 'package:DolokLib/screens/home/get/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'special_kategori_title.dart';

class SpecialOffers extends GetWidget<HomeController> {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionKategoriTitle(
            title: "Kategori",
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Obx((){
          return SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                final category = controller.categories[index];
                return SpecialOfferCard(
                  image: "assets/images/Book1.jpg",
                  category: category.namaKategori ?? '-',
                  numOfBrands: category.id,
                  press: () => Get.toNamed(BookPage.routeName, arguments: category.id),
                );
              },
              itemCount: controller.categories.length,
            ),
          );
        }),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              Text(category, style: Get.textTheme.titleSmall),
              Text('Lihat Detail', style: Get.textTheme.button?.copyWith(
                color: Colors.blue.shade400,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
