import 'package:DolokLib/models/book/book_model.dart';
import 'package:DolokLib/models/book_by_category/book_by_category.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    this.product,
    this.productByCategory,
    this.pressOnSeeMore,
  }) : super(key: key);

  final BookModel? product;
  final BookByCategory? productByCategory;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(child: ExtendedImage.network(
          product?.gambar ?? 
          productByCategory?.foto ?? 
          '-',
        )),
        Divider(
          color: Colors.grey.shade500,
        ),
        ListTile(
          title: Text('Judul', style: Get.textTheme.labelMedium),
          subtitle: Text(
            product?.judul ??
            productByCategory?.judul ??
            '-', style: Get.textTheme.titleMedium),
        ),
        Divider(
          color: Colors.grey.shade500,
        ),
        ListTile(
          title: Text('Kategori Buku', style: Get.textTheme.labelMedium),
          subtitle: Text(
            product?.kategori ??
            productByCategory?.category.namaKategori ??
            '-', style: Get.textTheme.titleMedium),
        ),
        Divider(
          color: Colors.grey.shade500,
        ),
        ListTile(
          title: Text('Pengarang', style: Get.textTheme.labelMedium),
          subtitle: Text(
            product?.pengarang ?? 
            productByCategory?.pengarang ??
            '-', style: Get.textTheme.titleMedium),
        ),
        Divider(
          color: Colors.grey.shade500,
        ),
        ListTile(
          title: Text('Penerbit', style: Get.textTheme.labelMedium),
          subtitle: Text(
            product?.penerbit ??
            productByCategory?.penerbit ??
            '-', style: Get.textTheme.titleMedium),
        ),
        Divider(
          color: Colors.grey.shade500,
        ),
        ListTile(
          title: Text('Tahun Terbit', style: Get.textTheme.labelMedium),
          subtitle: Text(
            product?.tahunTerbit ??
            productByCategory?.createdAt.toIso8601String() ??
            '-', style: Get.textTheme.titleMedium),
        ),
        Divider(
          color: Colors.grey.shade500,
        ),
        ListTile(
          title: Text('Jumlah Halaman', style: Get.textTheme.labelMedium),
          subtitle:
              Text(product?.jumlahHalaman ??
                   productByCategory?.jumlahHalaman ??
                   '-', style: Get.textTheme.titleMedium),
        ),
        Divider(
          color: Colors.grey.shade500,
        ),
      ],
    );
  }
}
