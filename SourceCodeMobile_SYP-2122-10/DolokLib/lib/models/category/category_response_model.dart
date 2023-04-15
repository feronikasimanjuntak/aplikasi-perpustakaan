import 'package:DolokLib/models/category/category_links_model.dart';
import 'package:DolokLib/models/category/category_meta_model.dart';
import 'package:DolokLib/models/category/category_model.dart';

class CategoryResponseModel {
    CategoryResponseModel({
        required this.data,
        required this.links,
        required this.meta,
    });

    final List<CategoryModel> data;
    final CategoryLinksModel links;
    final CategoryMetaModel meta;

    factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
        data: List<CategoryModel>.from(json["data"].map((x) => CategoryModel.fromJson(x))),
        links: CategoryLinksModel.fromJson(json["links"]),
        meta: CategoryMetaModel.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<CategoryModel>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
    };
}