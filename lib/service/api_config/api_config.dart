import 'dart:convert'; // Required for base64 encoding
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiConfig {
  static final ApiConfig _singleton = ApiConfig._internal();

  factory ApiConfig() {
    return _singleton;
  }

  late Dio dio;

  ApiConfig._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://octopus-app-9kaev.ondigitalocean.app',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    )
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
  }

  Future<Response> callAPI(String username, String password) async {
    var auth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    print('------------------${username} : ${password}');
    print('------------------${auth}');
    var response = await dio.post(
      '/login',
      options: Options(headers: <String, String>{'authorization': auth}),
    );
    return response;
  }
}
