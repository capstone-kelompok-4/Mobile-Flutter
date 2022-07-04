// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetailModel _$CourseDetailModelFromJson(Map<String, dynamic> json) =>
    CourseDetailModel(
      timestamp: json['timestamp'] as String,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CourseDetailData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseDetailModelToJson(CourseDetailModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'message': instance.message,
      'data': instance.data,
    };

CourseDetailData _$CourseDetailDataFromJson(Map<String, dynamic> json) =>
    CourseDetailData(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      rate: (json['rate'] as num).toDouble(),
      targetLearner: (json['target_learner'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      objectiveLearner: (json['objective_learner'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      specialization: CourseDetailDataSpecialization.fromJson(
          json['course_specialization'] as Map<String, dynamic>),
      sections: (json['sections'] as List<dynamic>)
          .map((e) =>
              CourseDetailDataSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseDetailDataToJson(CourseDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'rate': instance.rate,
      'target_learner': instance.targetLearner,
      'objective_learner': instance.objectiveLearner,
      'course_specialization': instance.specialization,
      'sections': instance.sections,
    };

CourseDetailDataSpecialization _$CourseDetailDataSpecializationFromJson(
        Map<String, dynamic> json) =>
    CourseDetailDataSpecialization(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CourseDetailDataSpecializationToJson(
        CourseDetailDataSpecialization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CourseDetailDataSection _$CourseDetailDataSectionFromJson(
        Map<String, dynamic> json) =>
    CourseDetailDataSection(
      id: json['id'] as int,
      name: json['name'] as String,
      materials: (json['materials'] as List<dynamic>)
          .map((e) => CourseDetailDataSectionMaterial.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseDetailDataSectionToJson(
        CourseDetailDataSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'materials': instance.materials,
    };

CourseDetailDataSectionMaterial _$CourseDetailDataSectionMaterialFromJson(
        Map<String, dynamic> json) =>
    CourseDetailDataSectionMaterial(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CourseDetailDataSectionMaterialToJson(
        CourseDetailDataSectionMaterial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'url': instance.url,
    };
