import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/post_controller.dart';
import 'pages/home_page.dart';
import 'services/post_api_service.dart';
import 'api/api_client.dart';

void main() {
  final dio = ApiClient().dio;

  Get.put(PostController(PostApiService(dio)));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
