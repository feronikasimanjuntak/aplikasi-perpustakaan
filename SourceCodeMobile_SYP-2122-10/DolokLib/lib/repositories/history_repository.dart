import 'package:DolokLib/models/history/history.dart';
import 'package:DolokLib/models/history/history_response.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';

import '../consts/endpoints.dart';
import '../consts/local.dart';

class HistoryRepository {
  final Dio _client;
  final GetStorage _local;

  HistoryRepository({
    required Dio client,
    required GetStorage local,
  })  : _client = client,
        _local = local;

  Future<List<History>> list(int page) async {
    final headers = {
      'Authorization': _local.read(token),
    };

    final responseJson = await _client.get(Endpoints.history,
        options: Options(
          headers: headers,
        ),
        queryParameters: {
          'page': page,
        });

    final model = HistoryResponse.fromJson(responseJson.data);

    return model.data;
  }

  Future<bool> extend(int historyId) async {
    final headers = {
      'Authorization': _local.read(token),
    };

    final responseJson = await _client.patch(
      '${Endpoints.extend}/$historyId',
      options: Options(
        headers: headers,
      ),
    );

    return responseJson.statusCode == HttpStatus.created;
  }

  Future<bool> borrowReturn(int historyId) async {
      final headers = {
      'Authorization': _local.read(token),
    };

    final responseJson = await _client.patch(
      '${Endpoints.borrowReturn}/$historyId',
      options: Options(
        headers: headers,
      ),
    );

    return responseJson.statusCode == HttpStatus.created;
  }
}
