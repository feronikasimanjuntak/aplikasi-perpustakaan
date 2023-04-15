import 'package:DolokLib/features/gallery/get/gallery_controller.dart';
import 'package:DolokLib/models/gallery/gallery.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GalleryPage extends GetView<GalleryController> {
  const GalleryPage({Key? key}) : super(key: key);

  static const routeName = '/gallery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeri', style: Get.textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: list(context),
      ),
    );
  }

  Widget list(BuildContext context) {
    return PagedGridView<int, Gallery>(
      pagingController: controller.pagingController,
      builderDelegate: PagedChildBuilderDelegate<Gallery>(
        itemBuilder: (context, item, index) => tile(context, item),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 6,
        childAspectRatio: 0.5,
      ),
    );
  }

  Widget tile(BuildContext context, Gallery gallery) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ExtendedImage.network(
            gallery.foto,
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
        Text(gallery.keterangan, style: Get.textTheme.titleMedium),
      ],
    );
  }
}
