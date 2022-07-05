import 'package:json_annotation/json_annotation.dart';

import '../course_detail/course_detail_model.dart';

part 'course_taken_model.g.dart';

@JsonSerializable()
class CourseTakenModel {
  String timestamp;
  String message;
  List<CourseTakenData> data;

  CourseTakenModel({
    required this.timestamp,
    required this.message,
    required this.data,
  });

  factory CourseTakenModel.fromJson(Map<String, dynamic> json) => _$CourseTakenModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseTakenModelToJson(this);
}

@JsonSerializable()
class CourseTakenData {
  int id;
  double? rate;
  @JsonKey(name: 'taken_at')
  String takenAt;
  @JsonKey(name: 'course_take')
  CourseDetailData course;

  CourseTakenData({
    required this.id,
    required this.rate,
    required this.takenAt,
    required this.course,
  });

  factory CourseTakenData.fromJson(Map<String, dynamic> json) => _$CourseTakenDataFromJson(json);

  Map<String, dynamic> toJson() => _$CourseTakenDataToJson(this);
}
