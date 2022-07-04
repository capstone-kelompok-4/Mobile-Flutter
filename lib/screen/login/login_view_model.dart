import 'package:flutter/material.dart';
import 'package:lms/data/api/api_service.dart';
import 'package:lms/data/preferences/user_preference.dart';
import 'package:lms/utils/get_connection.dart';
import 'package:lms/utils/result_state.dart';

import '../../data/model/login/login_model.dart';
import '../../data/model/user/user_model.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final GetConnection _getConnection = GetConnection();
  final UserPreference _userPreference = UserPreference();

  ResultState _state = ResultState.none;
  ResultState get state => _state;

  ResultState _stateUser = ResultState.none;
  ResultState get stateUser => _stateUser;

  String _token = "";
  String get token => _token;

  UserDataModel? _userLogin;
  UserDataModel? get userLogin => _userLogin;

  Future<LoginModel> login(String email, String password) async {
    changeState(ResultState.loading);
    try {
      final connection = await _getConnection.getConnection();

      if (!connection) {
        changeState(ResultState.error);
        return LoginModel(timestamp: "", message: "Something wrong");
      }

      final result = await _apiService.login(email, password);

      if (result.data == null) {
        changeState(ResultState.error);
        return result;
      }

      _userPreference.setUserToken(result.data!.token);
      await getUserTokenPref();
      await getUser();

      changeState(ResultState.hasData);

      return result;
    } catch (e) {
      changeState(ResultState.error);
      return LoginModel(timestamp: "", message: "Something wrong");
    }
  }

  Future<void> getUser() async {
    changeStateUser(ResultState.loading);
    try {
      final result = await _apiService.getUser(token);

      if (result.data == null) {
        changeStateUser(ResultState.error);
        return;
      }

      _userPreference.setUser(result.data!);
      getUserPref();

      changeStateUser(ResultState.hasData);
    } catch (e) {
      changeStateUser(ResultState.error);
    }
  }

  Future<dynamic> getUserTokenPref() async {
    final result = await _userPreference.getUserToken;

    if (result != null) {
      _token = result;
      notifyListeners();
    }

    return result;
  }

  Future<dynamic> getUserPref() async {
    final result = await _userPreference.getUser;

    _userLogin = result;

    notifyListeners();
    return result;
  }

  void changeState(ResultState s) {
    _state = s;
    notifyListeners();
  }

  void changeStateUser(ResultState s) {
    _stateUser = s;
    notifyListeners();
  }
}
