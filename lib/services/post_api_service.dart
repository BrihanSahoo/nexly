import 'package:dio/dio.dart';
import '../models/post.dart';

class PostApiService {
  final Dio dio;
  PostApiService(this.dio);

  Future<List<Post>> getPosts() async {
    try{
      final response = await dio.get('/posts');

      final List data = response.data;

      return data
            .map(
              (json) => Post.fromJson(
                json as Map<String,dynamic>,
              ),
            )
            .toList();
    } on DioException catch(e) {
      throw Exception(
        e.message ?? "Something went wrong."
      );
    }
  }
}