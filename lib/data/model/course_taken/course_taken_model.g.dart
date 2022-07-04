// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_taken_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseTakenModel _$CourseTakenModelFromJson(Map<String, dynamic> json) =>
    CourseTakenModel(
      timestamp: json['timestamp'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CourseTakenData.fromJson(e as Map<String, dynamic>))
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
      rate: (json['rate'] as num).toDouble(),
      takenAt: json['taken_at'] as String,
      course: CourseDetailData.fromJson(
          json['course_take'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseTakenDataToJson(CourseTakenData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'taken_at': instance.takenAt,
      'course_take': instance.course,
    };
