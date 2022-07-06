// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_youtube_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoYoutubeModel _$VideoYoutubeModelFromJson(Map<String, dynamic> json) =>
    VideoYoutubeModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => VideoYoutubeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoYoutubeModelToJson(VideoYoutubeModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

VideoYoutubeData _$VideoYoutubeDataFromJson(Map<String, dynamic> json) =>
    VideoYoutubeData(
      iTag: json['itag'] as int,
      mimeType: json['mimeType'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      contentLength: json['contentLength'] as String?,
      quality: json['quality'] as String,
      qualityLabel: json['qualityLabel'] as String,
      audioQuality: json['audioQuality'] as String?,
      audioSampleRate: json['audioSampleRate'] as String?,
      url: json['url'] as String,
      signatureCipher: json['signatureCipher'] as String?,
    );

Map<String, dynamic> _$VideoYoutubeDataToJson(VideoYoutubeData instance) =>
    <String, dynamic>{
      'itag': instance.iTag,
      'mimeType': instance.mimeType,
      'width': instance.width,
      'height': instance.height,
      'contentLength': instance.contentLength,
      'quality': instance.quality,
      'qualityLabel': instance.qualityLabel,
      'audioQuality': instance.audioQuality,
      'audioSampleRate': instance.audioSampleRate,
      'url': instance.url,
      'signatureCipher': instance.signatureCipher,
    };
