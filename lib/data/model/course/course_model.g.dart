// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      timestamp: json['timestamp'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CourseDetailData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'message': instance.message,
      'data': instance.data,
    };
