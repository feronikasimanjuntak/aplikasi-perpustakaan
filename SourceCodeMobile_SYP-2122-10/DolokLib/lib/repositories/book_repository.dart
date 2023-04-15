import 'package:DolokLib/models/book/book_model.dart';
import 'package:DolokLib/models/book/book_response_model.dart';
import 'package:DolokLib/models/book_by_category/book_by_category.dart';
import 'package:DolokLib/models/book_by_category/book_by_category_response.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';

import '../consts/endpoints.dart';
import '../consts/local.dart';

class BookRepository {
  final Dio _client;
  final GetStorage _local;

  BookRepository({
    required Dio client,
    required GetStorage local,
  })  : _client = client,
        _local = local;

  Future<List<BookModel>> list(int page) async {
    final headers = {
      'Authorization': _local.read(token),
    };

    final responseJson = await _client.get(
      Endpoints.book,
      options: Options(
        headers: headers,
      ),
      queryParameters: {
        'page': page,
      }
    );

    final model = BookResponseModel.fromJson(responseJson.data);

    return model.data;
  }

  Future<List<BookByCategory>> byCategory({
    required int category, 
    required int page
  }) async {
    final headers = {
      'Authorization': _local.read(token),
    };

    final responseJson = await _client.get(
      '${Endpoints.bookByCategory}/$category',
      options: Options(
        headers: headers,
      ),
      queryParameters: {
        'page': page,
      },
    );

    final model = BookByCategoryResponse.fromJson(responseJson.data);

    return model.data;
  }

  Future<bool> borrow(int bookId) async {
    final headers = {
      'Authorization': _local.read(token),
    };

    final responseJson = await _client.post(
      '${Endpoints.borrow}/$bookId',
      options: Options(
        headers: headers,
      ),
    );

    return responseJson.statusCode == HttpStatus.created;
  }

  Future<List<BookModel>> search(String query) async {
    final headers = {
      'Authorization': _local.read(token),
    };

    final responseJson = await _client.get(
      '${Endpoints.search}/$query',
      options: Options(
        headers: headers,
      ),
    );

    final model = BookResponseModel.fromJson(responseJson.data);

    return model.data;
  }
}
