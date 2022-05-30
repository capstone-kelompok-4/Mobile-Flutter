import 'package:shared_preferences/shared_preferences.dart';

class LoginPreference {
  final Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  static const userLoginKey = 'USER_LOGIN_KEY';

  Future<dynamic> get getUserLogin async {}

  void setUserLogin(dynamic user) {}
}
