import 'package:json_annotation/json_annotation.dart';

part 'video_youtube_model.g.dart';

@JsonSerializable()
class VideoYoutubeModel {
  bool status;
  String message;
  List<VideoYoutubeData>? data;

  VideoYoutubeModel({required this.status, required this.message, this.data});

  factory VideoYoutubeModel.fromJson(Map<String, dynamic> json) =>
      _$VideoYoutubeModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoYoutubeModelToJson(this);
}

@JsonSerializable()
class VideoYoutubeData {
  @JsonKey(name: 'itag')
  int iTag;
  String mimeType;
  int width;
  int height;
  String? contentLength;
  String quality;
  String qualityLabel;
  String? audioQuality;
  String? audioSampleRate;
  String url;
  String? signatureCipher;

  VideoYoutubeData({
    required this.iTag,
    required this.mimeType,
    required this.width,
    required this.height,
    this.contentLength,
    required this.quality,
    required this.qualityLabel,
    this.audioQuality,
    this.audioSampleRate,
    required this.url,
    this.signatureCipher,
  });

  factory VideoYoutubeData.fromJson(Map<String, dynamic> json) => _$VideoYoutubeDataFromJson(json);

  Map<String, dynamic> toJson() => _$VideoYoutubeDataToJson(this);
}
