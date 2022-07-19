// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_taken_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseTakenModel _$CourseTakenModelFromJson(Map<String, dynamic> json) =>
    CourseTakenModel(
      timestamp: json['timestamp'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CourseTakenData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseTakenModelToJson(CourseTakenModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'message': instance.message,
      'data': instance.data,
    };

CourseTakenData _$CourseTakenDataFromJson(Map<String, dynamic> json) =>
    CourseTakenData(
      id: json['id'] as int,
      progress: json['progress'] as int,
      rate: (json['rate'] as num?)?.toDouble(),
      requestType: json['request_type'] as String,
      requestDetail: json['request_detail'] as String,
      status: json['status'] as String,
      takenAt: json['taken_at'] as String?,
      course: CourseDetailData.fromJson(
          json['course_take'] as Map<String, dynamic>),
      reports: (json['reports'] as List<dynamic>?)
          ?.map(
              (e) => CourseTakenDataReport.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseTakenDataToJson(CourseTakenData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'progress': instance.progress,
      'rate': instance.rate,
      'request_type': instance.requestType,
      'request_detail': instance.requestDetail,
      'status': instance.status,
      'taken_at': instance.takenAt,
      'course_take': instance.course,
      'reports': instance.reports,
    };

CourseTakenDataReport _$CourseTakenDataReportFromJson(
        Map<String, dynamic> json) =>
    CourseTakenDataReport(
      id: json['id'] as int,
      completed: json['completed'] as bool,
      score: json['score'] as int,
      material: CourseDetailDataSectionMaterial.fromJson(
          json['material'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseTakenDataReportToJson(
        CourseTakenDataReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'completed': instance.completed,
      'score': instance.score,
      'material': instance.material,
    };
