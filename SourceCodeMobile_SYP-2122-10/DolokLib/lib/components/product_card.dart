import 'package:DolokLib/models/book/book_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:DolokLib/screens/details/details_screen.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 150,
    this.height = 160,
    required this.product,
  }) : super(key: key);

  final double width, height;
  final BookModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(
              product: product,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ExtendedImage.network(
                    product.gambar ?? '-',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                product.judul,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
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
