// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestCourseModel _$RequestCourseModelFromJson(Map<String, dynamic> json) =>
    RequestCourseModel(
      timestamp: json['timestamp'] as String,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CourseTakenData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestCourseModelToJson(RequestCourseModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'message': instance.message,
      'data': instance.data,
    };
