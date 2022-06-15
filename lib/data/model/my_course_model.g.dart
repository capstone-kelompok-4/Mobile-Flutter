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
      image: json['image'] as String,
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
      progress: json['progress'] as int,
      materials: (json['materials'] as List<dynamic>)
          .map((e) => DataMaterialCourse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataMyCourseToJson(DataMyCourse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'rating': instance.rating,
      'progress': instance.progress,
      'materials': instance.materials,
    };

DataMaterialCourse _$DataMaterialCourseFromJson(Map<String, dynamic> json) =>
    DataMaterialCourse(
      id: json['id'] as int,
      name: json['name'] as String,
      dataVideo: json['data_video'] == null
          ? null
          : DataVideoMaterial.fromJson(
              json['data_video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataMaterialCourseToJson(DataMaterialCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'data_video': instance.dataVideo,
    };

DataVideoMaterial _$DataVideoMaterialFromJson(Map<String, dynamic> json) =>
    DataVideoMaterial(
      url: json['url'] as String,
      timeline: (json['timeline'] as List<dynamic>)
          .map((e) => DataTimelineVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataVideoMaterialToJson(DataVideoMaterial instance) =>
    <String, dynamic>{
      'url': instance.url,
      'timeline': instance.timeline,
    };

DataTimelineVideo _$DataTimelineVideoFromJson(Map<String, dynamic> json) =>
    DataTimelineVideo(
      name: json['name'] as String,
      from: json['from'] as String,
    );

Map<String, dynamic> _$DataTimelineVideoToJson(DataTimelineVideo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'from': instance.from,
    };
