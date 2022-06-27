import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/data/model/course_detail_model.dart';
import 'package:lms/utils/course_state.dart';

import '../../data/model/course_overview_model.dart';
import '../../utils/result_state.dart';

class CourseViewModel extends ChangeNotifier {
  CourseState _courseState = CourseState.myCourse;
  CourseState get courseState => _courseState;

  ResultState _stateMyCourses = ResultState.none;
  ResultState get stateMyCourses => _stateMyCourses;

  List<DataMyCourse> _myCourses = [];
  List<DataMyCourse> get myCourses => _myCourses;

  ResultState _stateCourseOverview = ResultState.none;
  ResultState get stateCourseOverview => _stateCourseOverview;

  List<DataCourseOverView> _courseOverview = [];
  List<DataCourseOverView> get courseOverview => _courseOverview;

  void getMyCourseFromJson() async {
    changeMyCoursesState(ResultState.loading);
    try {
      final String raw = await rootBundle.loadString('assets/json/my_courses.json');
      final CourseDetailModel listMyCourse = CourseDetailModel.fromJson(json.decode(raw));

      _myCourses = listMyCourse.data;
      changeMyCoursesState(ResultState.hasData);
    } catch (e) {
      changeMyCoursesState(ResultState.error);
    }
  }

  void getCourseOverviewFromJson() async {
    changeCourseOverviewState(ResultState.loading);
    try {
      final String raw = await rootBundle.loadString('assets/json/course_overview.json');
      final CourseOverviewModel listCourseOverview = CourseOverviewModel.fromJson(json.decode(raw));

      _courseOverview = listCourseOverview.data;
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
