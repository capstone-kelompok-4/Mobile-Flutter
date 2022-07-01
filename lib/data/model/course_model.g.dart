// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CourseDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CourseDataModel _$CourseDataModelFromJson(Map<String, dynamic> json) =>
    CourseDataModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      coverPotrait: json['cover_potrait'] as String,
      coverLandscape: json['cover_landscape'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$CourseDataModelToJson(CourseDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'cover_potrait': instance.coverPotrait,
      'cover_landscape': instance.coverLandscape,
      'rating': instance.rating,
    };
