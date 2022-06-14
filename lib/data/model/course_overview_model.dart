import 'package:json_annotation/json_annotation.dart';

part 'course_overview_model.g.dart';

@JsonSerializable()
class CourseOverviewModel {
  List<DataCourseOverView> data;

  CourseOverviewModel({required this.data});

  factory CourseOverviewModel.fromJson(Map<String, dynamic> json) =>
      _$CourseOverviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseOverviewModelToJson(this);
}

@JsonSerializable()
class DataCourseOverView {
  String name;
  int amountOfMaterial;
  double rating;
  String image;

  DataCourseOverView(
      {required this.name,
      required this.amountOfMaterial,
      required this.rating,
      required this.image});

  factory DataCourseOverView.fromJson(Map<String, dynamic> json) =>
      _$DataCourseOverViewFromJson(json);

  Map<String, dynamic> toJson() => _$DataCourseOverViewToJson(this);
}
