import 'package:flutter/foundation.dart';
import 'package:lms/data/preferences/user_preference.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserPreference _userPreference = UserPreference();

  void logout() {
    _userPreference.removeUserToken();
    _userPreference.removeUser();
  }
}
