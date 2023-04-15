import 'package:DolokLib/models/gallery/gallery.dart';
import 'package:DolokLib/models/gallery/gallery_response.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../consts/endpoints.dart';
import '../consts/local.dart';

class GalleryRepository {
  final Dio _client;
  final GetStorage _local;

  GalleryRepository({
    required Dio client,
    required GetStorage local,
  })  : _client = client,
        _local = local;

  Future<List<Gallery>> list(int page) async {
    final headers = {
      'Authorization': _local.read(token),
    };

    final responseJson = await _client.get(
      Endpoints.gallery,
      options: Options(
        headers: headers,
      ),
      queryParameters: {
        'page': page,
      }
    );

    final model = GalleryResponse.fromJson(responseJson.data);

    return model.data;
  }
}
