import 'package:DolokLib/models/book/book_detail_model.dart';

class BookDetailResponseModel {
    BookDetailResponseModel({
        required this.data,
    });

    final BookDetailModel data;

    factory BookDetailResponseModel.fromJson(Map<String, dynamic> json) => BookDetailResponseModel(
        data: BookDetailModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}