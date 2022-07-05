import 'package:flutter/material.dart';

import '../../data/api/api_service.dart';
import '../../data/model/user/user_model.dart';
import '../../data/preferences/user_preference.dart';
import '../../utils/get_connection.dart';
import '../../utils/result_state.dart';

class ProfileChangePasswordViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final GetConnection _getConnection = GetConnection();
  final UserPreference _userPreference = UserPreference();

  ResultState _state = ResultState.none;
  ResultState get state => _state;

  Future<UserModel> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    changeState(ResultState.loading);
    try {
      final connection = await _getConnection.getConnection();

      if (!connection) {
        changeState(ResultState.error);
        return UserModel(timestamp: "", message: "No connection internet");
      }

      final token = await _userPreference.getUserToken;
      final result = await _apiService.changePassword(token, currentPassword, newPassword);

      if (result.data == null) {
        changeState(ResultState.error);
        return result;
      }

      changeState(ResultState.hasData);
      return result;
    } catch (e) {
      changeState(ResultState.error);
      return UserModel(timestamp: "", message: "Terjadi Kesalahan");
    }
  }

  void changeState(ResultState s) {
    _state = s;
    notifyListeners();
  }
}
