import 'package:json_annotation/json_annotation.dart';

part 'my_course_model.g.dart';

@JsonSerializable()
class MyCourseModel {
  List<DataMyCourse> data;

  MyCourseModel({required this.data});

  factory MyCourseModel.fromJson(Map<String, dynamic> json) => _$MyCourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyCourseModelToJson(this);
}

@JsonSerializable()
class DataMyCourse {
  String name;
  int progress;
  String image;

  DataMyCourse({required this.name, required this.progress, required this.image});

  factory DataMyCourse.fromJson(Map<String, dynamic> json) => _$DataMyCourseFromJson(json);

  Map<String, dynamic> toJson() => _$DataMyCourseToJson(this);
}
