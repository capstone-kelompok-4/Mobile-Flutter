import 'package:json_annotation/json_annotation.dart';

import '../course_taken/course_taken_model.dart';

part 'request_course_model.g.dart';

@JsonSerializable()
class RequestCourseModel {
  String timestamp;
  String message;
  CourseTakenData? data;

  RequestCourseModel({
    required this.timestamp,
    required this.message,
    this.data,
  });

  factory RequestCourseModel.fromJson(Map<String, dynamic> json) =>
      _$RequestCourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestCourseModelToJson(this);
}
