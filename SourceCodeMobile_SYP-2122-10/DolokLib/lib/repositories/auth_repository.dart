import 'package:DolokLib/consts/endpoints.dart';
import 'package:DolokLib/consts/local.dart';
import 'package:DolokLib/models/login/login_model.dart';
import 'package:DolokLib/models/login/login_request.dart';
import 'package:DolokLib/models/register_request.dart';
import 'package:DolokLib/models/simple_response_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository {
  final Dio _client;
  final GetStorage _local;

  AuthRepository({
    required Dio client,
    required GetStorage local,
  })  : _client = client,
        _local = local;

  Future<LoginModel?> login(LoginRequest request) async {
    final payload = FormData.fromMap({
      'email': request.email,
      'password': request.password,
    });

    final responseJson = await _client.post(
      Endpoints.login,
      data: payload,
    );

    if (responseJson.statusCode == HttpStatus.ok) {
      final model = LoginModel.fromJson(responseJson.data);
      _local.write(token, 'Bearer ${model.accessToken}');
      return model;
    } else {
      return null;
    }
  }

  Future<SimpleResponseModel?> register(RegisterRequest request) async {
    final payload = FormData.fromMap({
      'name': request.name,
      'email': request.email,
      'no_hp': request.phone,
      'alamat': request.alamat,
      'password': request.password,
    });

    final responseJson = await _client.post(
      Endpoints.register,
      data: payload,
    );

    if (responseJson.statusCode == HttpStatus.created) {
      return SimpleResponseModel.fromJson(responseJson.data);
    } else {
      return null;
    }
  }

  Future<LoginModel?> logout() async {
    final responseJson = await _client.post(
      Endpoints.logout,
      options: Options(
        headers: {
          'Authorization': _local.read<String>(token),
        },
      ),
    );

    if (responseJson.statusCode == HttpStatus.ok) {
      _local.erase();
      return LoginModel.fromJson(responseJson.data);
    } else {
      _local.erase();
      return null;
    }
  }
}
