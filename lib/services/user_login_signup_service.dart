import 'package:dio/dio.dart';
import '../models/signup_request.dart';
import '../models/login_request.dart';
import '../storage/token_storage.dart';

class UserLoginSignupService {
  final Dio dio;
  UserLoginSignupService(this.dio);

  Future<void> register_user(SignUpRequest user) async {
    try {
      final response = await dio.post(
        "/user/register",
        data: {
          "username": user.userName,
          "email": user.email,
          "password": user.password,
          "phone_number": user.phoneNumber,
        },
      );
      final token = response.data['accessToken'];
      await TokenStorage().saveToken(token);
    } on DioException catch (e) {
      throw Exception(e.message ?? "Something went wrong.");
    }
  }

  Future<void> login_user(LoginRequest user) async {
    try {
      final response = await dio.post(
        '/user/login',
        data: {"email": user.email, "password": user.password},
      );
      final token = response.data["accessToken"];
      await TokenStorage().saveToken(token);
    } on DioException catch (e) {
      throw Exception(e.message ?? "Something went wrong.");
    }
  }

  Future<void> logOut() async {
    await TokenStorage().deleteToken();
  }
}
