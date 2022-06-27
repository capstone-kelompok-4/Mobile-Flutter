import 'package:flutter/material.dart';
import 'package:lms/utils/course_type_state.dart';

class DetailCourseViewModel extends ChangeNotifier {
  CourseTypeState _courseTypeState = CourseTypeState.request;
  CourseTypeState get courseTypeState => _courseTypeState;

  void changeCourseType(CourseTypeState s) {
    _courseTypeState = s;
    notifyListeners();
  }
}
