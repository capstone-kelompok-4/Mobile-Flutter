// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_overview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseOverviewModel _$CourseOverviewModelFromJson(Map<String, dynamic> json) =>
    CourseOverviewModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataCourseOverView.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseOverviewModelToJson(
        CourseOverviewModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataCourseOverView _$DataCourseOverViewFromJson(Map<String, dynamic> json) =>
    DataCourseOverView(
      name: json['name'] as String,
      amountOfMaterial: json['amountOfMaterial'] as int,
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$DataCourseOverViewToJson(DataCourseOverView instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amountOfMaterial': instance.amountOfMaterial,
      'rating': instance.rating,
      'image': instance.image,
    };
