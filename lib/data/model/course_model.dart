import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  bool status;
  String message;
  List<CourseDataModel>? data;

  CourseModel({required this.status, required this.message, this.data});

  factory CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}

@JsonSerializable()
class CourseDataModel {
  int id;
  String name;
  String description;
  @JsonKey(name: 'cover_potrait')
  String coverPotrait;
  @JsonKey(name: 'cover_landscape')
  String coverLandscape;
  double rating;

  CourseDataModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.coverPotrait,
      required this.coverLandscape,
      required this.rating});

  factory CourseDataModel.fromJson(Map<String, dynamic> json) => _$CourseDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDataModelToJson(this);
}
