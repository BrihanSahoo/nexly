import 'package:get/get.dart';

import '../models/post.dart';
import '../services/post_api_service.dart';

class PostController extends GetxController {
  final PostApiService apiService;

  PostController(this.apiService);

  final posts = <Post>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await apiService.getPosts();

      posts.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}