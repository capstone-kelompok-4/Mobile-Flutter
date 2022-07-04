import 'package:json_annotation/json_annotation.dart';

import '../course_detail/course_detail_model.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  String timestamp;
  String message;
  List<CourseDetailData> data;

  CourseModel({required this.timestamp, required this.message, required this.data});

  factory CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}
