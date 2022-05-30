import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com/";
  }

  Future<void> login(String email, String password) async {
    Response response = await _dio.request("users", options: Options(method: 'GET'));
    print(response.data);
  }
}
