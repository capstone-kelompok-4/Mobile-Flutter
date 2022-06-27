import 'package:flutter/material.dart';
import 'package:lms/utils/data_converter.dart';

class SectionVideoViewModel extends ChangeNotifier {
  int _recentPlayingMilliseconds = 0;
  int get recentPlayingMilliseconds => _recentPlayingMilliseconds;

  double _percentagePlaying = 0;
  double get percentagePlaying => _percentagePlaying;

  void setRecentPlayingSeconds(int current, int maxValue) {
    _recentPlayingMilliseconds = current;

    double percentage = DataConverter.convertValueInRangeToPercentage(
        double.parse(maxValue.toString()), double.parse(current.toString()), 33.3);

    if (percentage <= 33.3) {
      _percentagePlaying = percentage;
    }

    notifyListeners();
  }
}
