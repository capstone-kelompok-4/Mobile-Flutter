import 'package:json_annotation/json_annotation.dart';

import '../course_detail/course_detail_model.dart';

part 'course_taken_model.g.dart';

@JsonSerializable()
class CourseTakenModel {
  String timestamp;
  String message;
  List<CourseTakenData>? data;

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
  int progress;
  double? rate;
  @JsonKey(name: 'request_type')
  String requestType;
  @JsonKey(name: 'request_detail')
  String requestDetail;
  String status;
  @JsonKey(name: 'taken_at')
  String? takenAt;
  @JsonKey(name: 'course_take')
  CourseDetailData course;
  List<CourseTakenDataReport>? reports;

  CourseTakenData({
    required this.id,
    required this.progress,
    this.rate,
    required this.requestType,
    required this.requestDetail,
    required this.status,
    this.takenAt,
    required this.course,
    this.reports,
  });

  factory CourseTakenData.fromJson(Map<String, dynamic> json) => _$CourseTakenDataFromJson(json);

  Map<String, dynamic> toJson() => _$CourseTakenDataToJson(this);
}

@JsonSerializable()
class CourseTakenDataReport {
  int id;
  bool completed;
  int score;
  CourseDetailDataSectionMaterial material;

  CourseTakenDataReport({
    required this.id,
    required this.completed,
    required this.score,
    required this.material,
  });

  factory CourseTakenDataReport.fromJson(Map<String, dynamic> json) =>
      _$CourseTakenDataReportFromJson(json);

  Map<String, dynamic> toJson() => _$CourseTakenDataReportToJson(this);
}
