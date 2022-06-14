import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/model/my_course_model.dart';
import '../../utils/result_state.dart';

class HomeViewModel extends ChangeNotifier {
  ResultState _stateMyCourses = ResultState.none;
  ResultState get stateMyCourses => _stateMyCourses;

  List<DataMyCourse> _myCourses = [];
  List<DataMyCourse> get myCourses => _myCourses;

  void getMyCourseFromJson() async {
    changeMyCoursesState(ResultState.loading);
    try {
      final String raw = await rootBundle.loadString('assets/json/my_courses.json');
      final MyCourseModel listMyCourse = MyCourseModel.fromJson(json.decode(raw));

      _myCourses = listMyCourse.data;
      changeMyCoursesState(ResultState.hasData);
    } catch (e) {
      changeMyCoursesState(ResultState.error);
    }
  }

  void changeMyCoursesState(ResultState s) {
    _stateMyCourses = s;
    notifyListeners();
  }
}
