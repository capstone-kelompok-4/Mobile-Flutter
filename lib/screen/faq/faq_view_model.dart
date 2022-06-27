import 'package:flutter/material.dart';
import 'package:lms/utils/faq_state.dart';

class FaqViewModel extends ChangeNotifier {
  FaqState _faqState = FaqState.account;
  FaqState get faqState => _faqState;

  int _lengthFaqAccount = 5;
  int get lengthFaqAccount => _lengthFaqAccount;

  int _lengthFaqGuide = 8;
  int get lengthFaqGuide => _lengthFaqGuide;

  void changeFaqState(FaqState s) {
    _faqState = s;
    notifyListeners();
  }
}
