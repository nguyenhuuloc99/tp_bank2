import 'dart:convert';

import 'package:dio/dio.dart';

class ApiConfig {
  static final ApiConfig _singleton = ApiConfig._internal();

  factory ApiConfig() {
    return _singleton;
  }

  late Dio dio;

  ApiConfig._internal() {
    dio = Dio();
  }

  Future<Response> callAPI(String username, String password) async {
    var auth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    var response = await dio.post('/api/test',
        options: Options(headers: <String, String>{'authorization': auth}));
    return response;
  }
}
