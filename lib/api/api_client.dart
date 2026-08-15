import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'http://10.0.2.2:8080',
          headers: {"Content-Type": "Application/json"},
        ),
      );
}
