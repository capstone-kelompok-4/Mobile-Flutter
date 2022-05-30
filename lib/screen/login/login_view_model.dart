import 'package:flutter/material.dart';
import 'package:lms/data/api/api_service.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  Future<void> login(String email, String password) async {
    await _apiService.login(email, password);
  }
}
