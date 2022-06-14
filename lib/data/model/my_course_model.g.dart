// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCourseModel _$MyCourseModelFromJson(Map<String, dynamic> json) =>
    MyCourseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataMyCourse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyCourseModelToJson(MyCourseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataMyCourse _$DataMyCourseFromJson(Map<String, dynamic> json) => DataMyCourse(
      name: json['name'] as String,
      progress: json['progress'] as int,
      image: json['image'] as String,
    );

Map<String, dynamic> _$DataMyCourseToJson(DataMyCourse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'progress': instance.progress,
      'image': instance.image,
    };
