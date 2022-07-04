import 'package:flutter/material.dart';
import 'package:lms/data/api/api_service.dart';
import 'package:lms/data/model/course_detail/course_detail_model.dart';
import 'package:lms/data/model/course_taken/course_taken_model.dart';
import 'package:lms/utils/course_state.dart';

import '../../data/preferences/user_preference.dart';
import '../../utils/get_connection.dart';
import '../../utils/result_state.dart';

class CourseViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final GetConnection _getConnection = GetConnection();
  final UserPreference _userPreference = UserPreference();

  CourseState _courseState = CourseState.myCourse;
  CourseState get courseState => _courseState;

  ResultState _stateMyCourses = ResultState.none;
  ResultState get stateMyCourses => _stateMyCourses;

  List<CourseTakenData> _myCourses = [];
  List<CourseTakenData> get myCourses => _myCourses;

  ResultState _stateCourseOverview = ResultState.none;
  ResultState get stateCourseOverview => _stateCourseOverview;

  List<CourseDetailData> _courseOverview = [];
  List<CourseDetailData> get courseOverview => _courseOverview;

  void getCourseTaken() async {
    changeMyCoursesState(ResultState.loading);
    try {
      final connection = await _getConnection.getConnection();

      if (!connection) {
        changeMyCoursesState(ResultState.error);
        return;
      }

      final token = await _userPreference.getUserToken;

      final result = await _apiService.getCourseTaken(token);

      if (result.timestamp.isEmpty) {
        changeMyCoursesState(ResultState.error);
        return;
      }

      _myCourses = result.data;

      changeMyCoursesState(ResultState.hasData);
    } catch (e) {
      changeMyCoursesState(ResultState.error);
    }
  }

  void getAllCourses() async {
    changeCourseOverviewState(ResultState.loading);
    try {
      final connection = await _getConnection.getConnection();

      if (!connection) {
        changeCourseOverviewState(ResultState.error);
        return;
      }

      final token = await _userPreference.getUserToken;

      final result = await _apiService.getAllCourses(token);

      if (result.timestamp.isEmpty) {
        changeCourseOverviewState(ResultState.error);
        return;
      }

      _courseOverview = result.data;

      changeCourseOverviewState(ResultState.hasData);
    } catch (e) {
      changeCourseOverviewState(ResultState.error);
    }
  }

  void changeMyCoursesState(ResultState s) {
    _stateMyCourses = s;
    notifyListeners();
  }

  void changeCourseOverviewState(ResultState s) {
    _stateCourseOverview = s;
    notifyListeners();
  }

  void changeCourseState(CourseState s) {
    _courseState = s;
    notifyListeners();
  }
}
