import 'package:json_annotation/json_annotation.dart';

part 'course_detail_model.g.dart';

@JsonSerializable()
class CourseDetailModel {
  String timestamp;
  String message;
  CourseDetailData? data;

  CourseDetailModel({
    required this.timestamp,
    required this.message,
    this.data,
  });

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailModelToJson(this);
}

@JsonSerializable()
class CourseDetailData {
  int id;
  String name;
  @JsonKey(name: 'banner_url')
  String? bannerUrl;
  String description;
  double? rate;
  @JsonKey(name: 'target_learner')
  List<String> targetLearner;
  @JsonKey(name: 'objective_learner')
  List<String> objectiveLearner;
  @JsonKey(name: 'methodology_learnings')
  List<String> methodologyLearnings;
  @JsonKey(name: 'course_specialization')
  CourseDetailDataSpecialization specialization;
  List<CourseDetailDataSection> sections;

  CourseDetailData({
    required this.id,
    required this.name,
    this.bannerUrl,
    required this.description,
    this.rate,
    required this.targetLearner,
    required this.objectiveLearner,
    required this.methodologyLearnings,
    required this.specialization,
    required this.sections,
  });

  factory CourseDetailData.fromJson(Map<String, dynamic> json) => _$CourseDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailDataToJson(this);
}

@JsonSerializable()
class CourseDetailDataSpecialization {
  int id;
  String name;

  CourseDetailDataSpecialization({
    required this.id,
    required this.name,
  });

  factory CourseDetailDataSpecialization.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailDataSpecializationFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailDataSpecializationToJson(this);
}

@JsonSerializable()
class CourseDetailDataSection {
  int id;
  int number;
  String name;
  List<CourseDetailDataSectionMaterial> materials;

  CourseDetailDataSection(
      {required this.id, required this.number, required this.name, required this.materials});

  factory CourseDetailDataSection.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailDataSectionFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailDataSectionToJson(this);
}

@JsonSerializable()
class CourseDetailDataSectionMaterial {
  int id;
  String name;
  String type;
  String url;

  CourseDetailDataSectionMaterial({
    required this.id,
    required this.name,
    required this.type,
    required this.url,
  });

  factory CourseDetailDataSectionMaterial.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailDataSectionMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailDataSectionMaterialToJson(this);
}
