import 'package:DolokLib/consts/endpoints.dart';
import 'package:DolokLib/consts/local.dart';
import 'package:DolokLib/models/category/category_model.dart';
import 'package:DolokLib/models/category/category_response_model.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class CategoryRepository {
  final Dio _client;
  final GetStorage _local;

  CategoryRepository({
    required Dio client,
    required GetStorage local,
  })  : _client = client,
        _local = local;

  Future<List<CategoryModel>> get list async {
    final headers = {
      'Authorization': _local.read(token),
    };

    final responseJson = await _client.get(
      Endpoints.category,
      options: Options(
        headers: headers,
      ),
    );

    final model = CategoryResponseModel.fromJson(responseJson.data);

    return model.data;
  }
}
