import 'package:flutter/material.dart';
import 'package:lms/data/api/api_service.dart';
import 'package:lms/data/model/request_course/request_course_model.dart';

import '../../data/preferences/user_preference.dart';
import '../../utils/get_connection.dart';
import '../../utils/result_state.dart';

class CourseRequestFormViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final GetConnection _getConnection = GetConnection();
  final UserPreference _userPreference = UserPreference();

  ResultState _state = ResultState.none;
  ResultState get state => _state;

  Future<RequestCourseModel> requestCourse(
      int idCourse, int requestType, String requestDetail) async {
    changeState(ResultState.loading);
    try {
      final connection = await _getConnection.getConnection();

      if (!connection) {
        changeState(ResultState.error);
        return RequestCourseModel(timestamp: "", message: "No connection internet");
      }

      final token = await _userPreference.getUserToken;
      final result = await _apiService.requestCourse(token, idCourse, requestType, requestDetail);

      if (result.timestamp.isEmpty) {
        changeState(ResultState.error);
        return result;
      }

      if (result.data == null) {
        changeState(ResultState.error);
        return result;
      }

      changeState(ResultState.hasData);
      return result;
    } catch (e) {
      changeState(ResultState.error);
      return RequestCourseModel(timestamp: "", message: "Terjadi kesalahan..");
    }
  }

  void changeState(ResultState s) {
    _state = s;
    notifyListeners();
  }
}
