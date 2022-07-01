import 'package:dio/dio.dart';
import 'package:lms/data/model/user_model.dart';

import '../model/login_model.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = "https://capstone-project-4.herokuapp.com/api";
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = 20 * 1000;
    _dio.options.receiveTimeout = 60 * 1000;
  }

  Future<LoginModel> login(String email, String password) async {
    try {
      Response response = await _dio.request("/auth/signin",
          options: Options(method: 'POST'), data: {"username": email, "password": password});

      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        return LoginModel.fromJson({"token": null});
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return LoginModel.fromJson({"token": null});
      }
      return LoginModel.fromJson({"token": null});
    }
  }

  Future<UserModel> getUser(String token) async {
    try {
      Response response = await _dio.request("/api/user",
          options: Options(method: 'POST', headers: {"authorization": "Bearer $token"}),
          data: {"token": token});

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        return UserModel.fromJson({"status": false, "message": "Failed to get data"});
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return UserModel.fromJson({"status": false, "message": "Connection timeout"});
      }
      return UserModel.fromJson({"status": false, "message": ex.response?.statusCode});
    }
  }
}
