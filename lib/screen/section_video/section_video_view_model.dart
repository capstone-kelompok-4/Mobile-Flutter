import 'package:flutter/material.dart';
import 'package:lms/data/api/api_other_service.dart';
import 'package:lms/data/model/video_youtube/video_youtube_model.dart';
import 'package:lms/utils/data_converter.dart';

import '../../utils/get_connection.dart';
import '../../utils/result_state.dart';

class SectionVideoViewModel extends ChangeNotifier {
  final ApiOtherService _apiOtherService = ApiOtherService();
  final GetConnection _getConnection = GetConnection();

  ResultState _state = ResultState.none;
  ResultState get state => _state;

  List<VideoYoutubeData> _videos = [];
  List<VideoYoutubeData> get videos => _videos;

  int _recentPlayingMilliseconds = 0;
  int get recentPlayingMilliseconds => _recentPlayingMilliseconds;

  double _percentagePlaying = 0;
  double get percentagePlaying => _percentagePlaying;

  Future<bool> getInformationVideo(String url) async {
    changeState(ResultState.loading);
    try {
      final connection = await _getConnection.getConnection();

      if (!connection) {
        changeState(ResultState.error);
        return false;
      }

      final result = await _apiOtherService.getInfoVideoYoutube(url);

      if (!result.status) {
        changeState(ResultState.error);
        return false;
      }

      if (result.data == null) {
        changeState(ResultState.error);
        return false;
      }

      _videos = result.data!;

      changeState(ResultState.hasData);
      return true;
    } catch (e) {
      changeState(ResultState.error);
      return true;
    }
  }

  void setRecentPlayingSeconds(int current, int maxValue) {
    _recentPlayingMilliseconds = current;

    double percentage = DataConverter.convertValueInRangeToPercentage(
        double.parse(maxValue.toString()), double.parse(current.toString()), 33.3);

    if (percentage <= 33.3) {
      _percentagePlaying = percentage;
    }

    notifyListeners();
  }

  void changeState(ResultState s) {
    _state = s;
    notifyListeners();
  }
}
