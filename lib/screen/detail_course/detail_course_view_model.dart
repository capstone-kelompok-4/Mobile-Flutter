import 'package:flutter/foundation.dart';
import 'package:lms/data/model/course_detail/course_detail_model.dart';
import 'package:lms/data/model/course_taken/course_taken_model.dart';
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

  ResultState _state = ResultState.none;
  ResultState get state => _state;

  ResultState _stateCourseTaken = ResultState.none;
  ResultState get stateCourseTaken => _stateCourseTaken;

  ResultState _stateRating = ResultState.none;
  ResultState get stateRating => _stateRating;

  late CourseDetailData _course;
  CourseDetailData get course => _course;

  CourseTakenData? _courseTaken;
  CourseTakenData? get courseTaken => _courseTaken;

  Future<void> getDetailCourse(int id) async {
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

  void getCourseTakenById(int id) async {
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

  Future<bool> editRating(int idCourseTaken, double rate) async {
    changeStateRating(ResultState.loading);
    try {
      final connection = await _getConnection.getConnection();

      if (!connection) {
        changeStateRating(ResultState.error);
        return false;
      }

      final token = await _userPreference.getUserToken;

      final result = await _apiService.editRatingCourse(token, idCourseTaken, rate);

      if (result.timestamp.isEmpty) {
        changeStateRating(ResultState.error);
        return false;
      }

      changeStateRating(ResultState.hasData);
      return true;
    } catch (e) {
      changeStateRating(ResultState.error);
      return false;
    }
  }

  void changeCourseTaken(CourseTakenData courseTaken) {
    _courseTaken = courseTaken;
    notifyListeners();
  }

  void changeCourseType(CourseTypeState s) {
    _courseTypeState = s;
    notifyListeners();
  }

  void changeState(ResultState s) {
    _state = s;
    notifyListeners();
  }

  void changeStateCourseTaken(ResultState s) {
    _stateCourseTaken = s;
    notifyListeners();
  }

  void changeStateRating(ResultState s) {
    _stateRating = s;
    notifyListeners();
  }
}
