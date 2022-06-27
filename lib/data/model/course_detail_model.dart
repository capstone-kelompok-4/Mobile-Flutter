import 'package:json_annotation/json_annotation.dart';

part 'course_detail_model.g.dart';

@JsonSerializable()
class CourseDetailModel {
  List<DataMyCourse> data;

  CourseDetailModel({required this.data});

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailModelToJson(this);
}

@JsonSerializable()
class DataMyCourse {
  String name;
  String image;
  String description;
  double rating;
  int progress;
  List<DataMaterialCourse> materials;

  DataMyCourse(
      {required this.name,
      required this.image,
      required this.description,
      required this.rating,
      required this.progress,
      required this.materials});

  factory DataMyCourse.fromJson(Map<String, dynamic> json) => _$DataMyCourseFromJson(json);

  Map<String, dynamic> toJson() => _$DataMyCourseToJson(this);
}

@JsonSerializable()
class DataMaterialCourse {
  int id;
  String name;
  @JsonKey(name: 'data_video')
  DataVideoMaterial? dataVideo;

  DataMaterialCourse({required this.id, required this.name, this.dataVideo});

  factory DataMaterialCourse.fromJson(Map<String, dynamic> json) =>
      _$DataMaterialCourseFromJson(json);

  Map<String, dynamic> toJson() => _$DataMaterialCourseToJson(this);
}

@JsonSerializable()
class DataVideoMaterial {
  String url;
  List<DataTimelineVideo> timelines;

  DataVideoMaterial({required this.url, required this.timelines});

  factory DataVideoMaterial.fromJson(Map<String, dynamic> json) =>
      _$DataVideoMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$DataVideoMaterialToJson(this);
}

@JsonSerializable()
class DataTimelineVideo {
  String name;
  String from;

  DataTimelineVideo({required this.name, required this.from});

  factory DataTimelineVideo.fromJson(Map<String, dynamic> json) =>
      _$DataTimelineVideoFromJson(json);

  Map<String, dynamic> toJson() => _$DataTimelineVideoToJson(this);
}
