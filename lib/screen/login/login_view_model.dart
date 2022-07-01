import 'package:flutter/material.dart';
import 'package:lms/data/api/api_service.dart';
import 'package:lms/data/preferences/user_preference.dart';
import 'package:lms/utils/get_connection.dart';
import 'package:lms/utils/result_state.dart';

import '../../data/model/login_model.dart';
import '../../data/model/user_model.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final GetConnection _getConnection = GetConnection();
  final UserPreference _userPreference = UserPreference();

  ResultState _state = ResultState.none;
  ResultState get state => _state;

  String _token = "";
  String get token => _token;

  UserDataModel _userLogin = UserDataModel(id: 0, email: "");
  UserDataModel get userLogin => _userLogin;

  Future<LoginModel> login(String email, String password) async {
    changeState(ResultState.loading);
    try {
      final connection = await _getConnection.getConnection();

      if (!connection) {
        changeState(ResultState.error);
        return LoginModel(token: null);
      }

      final result = await _apiService.login(email, password);

      if (result.token == null) {
        changeState(ResultState.error);
        return result;
      }

      _userPreference.setUserToken(result.token!);
      getUser();

      changeState(ResultState.hasData);
      return result;
    } catch (e) {
      changeState(ResultState.error);
      return LoginModel(token: null);
    }
  }

  Future<dynamic> getUser() async {
    final result = await _userPreference.getUser;

    if (result != null) {
      _userLogin = result as UserDataModel;
    }

    notifyListeners();
    return result;
  }

  Future<dynamic> getUserToken() async {
    final result = await _userPreference.getUserToken;

    if (result != null) {
      _token = result;
    }

    notifyListeners();
    return result;
  }

  void changeState(ResultState s) {
    _state = s;
    notifyListeners();
  }
}
