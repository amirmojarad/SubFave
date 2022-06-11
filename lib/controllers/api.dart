import 'package:dio/dio.dart';
import 'package:subfave/models/user.dart';
import 'package:subfave/screens/config.dart';

class Api {
  Dio dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:8080',
    headers: {"Accept": "application/json", "content-type": "application/json"},
  ));

  Future<Response> post(Map<String, dynamic> jsonBody, String urlPath) async {
    await user.loadUser();
    return await dio.post(
      urlPath,
      data: jsonBody,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${user.token}}',
        },
      ),
    );
  }

  Future<Response> get(String urlPath) async {
    return await dio.get(urlPath);
  }
}
