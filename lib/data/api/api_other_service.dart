import 'package:dio/dio.dart';
import 'package:lms/data/model/video_youtube/video_youtube_model.dart';

class ApiOtherService {
  final Dio _dio = Dio();
  final String _baseUrlDdg = "https://yt.ddg.my.id/";

  ApiOtherService() {
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = 20 * 1000;
    _dio.options.receiveTimeout = 60 * 1000;
  }

  Future<VideoYoutubeModel> getInfoVideoYoutube(String url) async {
    try {
      _dio.options.baseUrl = _baseUrlDdg;
      Response response = await _dio.request(
        "info.php",
        options: Options(method: 'GET'),
        queryParameters: {"url": url},
      );

      if (response.statusCode == 200) {
        print(VideoYoutubeModel.fromJson(response.data).toJson());
        return VideoYoutubeModel.fromJson(response.data);
      } else {
        return VideoYoutubeModel(status: false, message: "Failed to get data");
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return VideoYoutubeModel(status: false, message: "Connection timeout");
      }
      return VideoYoutubeModel(status: false, message: ex.message);
    }
  }
}
