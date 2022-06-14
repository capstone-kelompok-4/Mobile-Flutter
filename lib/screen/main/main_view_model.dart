import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  int _indexBottomNav = 0;
  int get indexBottomNav => _indexBottomNav;

  void setIndexBottomNav(int index) {
    _indexBottomNav = index;
    notifyListeners();
  }
}
