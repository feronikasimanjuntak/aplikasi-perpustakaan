import 'package:DolokLib/models/book/book_model.dart';
import 'package:DolokLib/models/book/links_model.dart';
import 'package:DolokLib/models/book/meta_model.dart';

class BookResponseModel {
    BookResponseModel({
      required this.data,
      required this.links,
      required this.meta,
    });

    final List<BookModel> data;
    final LinksModel links;
    final MetaModel meta;

    factory BookResponseModel.fromJson(Map<String, dynamic> json) => BookResponseModel(
        data: List<BookModel>.from(json["data"].map((x) => BookModel.fromJson(x))),
        links: LinksModel.fromJson(json["links"]),
        meta: MetaModel.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
    };
}