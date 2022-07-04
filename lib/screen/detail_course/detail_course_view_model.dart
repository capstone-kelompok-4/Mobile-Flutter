import 'package:flutter/material.dart';
import 'package:lms/data/model/course_detail/course_detail_model.dart';
import 'package:lms/utils/course_type_state.dart';
import 'package:lms/utils/result_state.dart';

import '../../data/api/api_service.dart';
import '../../data/preferences/user_preference.dart';
import '../../utils/get_connection.dart';

class DetailCourseViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final GetConnection _getConnection = GetConnection();
  final UserPreference _userPreference = UserPreference();

  CourseTypeState _courseTypeState = CourseTypeState.request;
  CourseTypeState get courseTypeState => _courseTypeState;

  ResultState _state = ResultState.loading;
  ResultState get state => _state;

  late CourseDetailData _course;
  CourseDetailData get course => _course;

  void getDetailCourse(int id) async {
    changeState(ResultState.loading);
    try {
      final connection = await _getConnection.getConnection();

      if (!connection) {
        changeState(ResultState.error);
        return;
      }

      final token = await _userPreference.getUserToken;

      final result = await _apiService.getCourseDetail(token, id);

      if (result.timestamp.isEmpty) {
        changeState(ResultState.error);
        return;
      }

      _course = result.data!;

      changeState(ResultState.hasData);
    } catch (e) {
      changeState(ResultState.error);
    }
  }

  void changeCourseType(CourseTypeState s) {
    _courseTypeState = s;
    notifyListeners();
  }

  void changeState(ResultState s) {
    _state = s;
    notifyListeners();
  }
}
