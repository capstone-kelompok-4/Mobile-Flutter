import 'dart:convert';

import 'package:lms/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();

  static const userKey = 'USER_KEY';
  static const userTokenKey = 'USER_TOKEN_KEY';

  Future<dynamic> get getUserToken async {
    final SharedPreferences prefs = await _sharedPreferences;

    final String? userToken = prefs.getString(userTokenKey);

    return userToken;
  }

  void setUserToken(String token) async {
    final SharedPreferences prefs = await _sharedPreferences;

    prefs.setString(userTokenKey, token);
  }

  void removeUserToken() async {
    final SharedPreferences prefs = await _sharedPreferences;

    prefs.remove(userTokenKey);
  }

  Future<dynamic> get getUser async {
    final SharedPreferences prefs = await _sharedPreferences;

    final String? dataUserPref = prefs.getString(userKey);

    if (dataUserPref == null) {
      return null;
    }

    return UserDataModel.fromJson(json.decode(dataUserPref));
  }

  void setUser(UserDataModel user) async {
    final SharedPreferences prefs = await _sharedPreferences;

    prefs.setString(userKey, json.encode(user.toJson()));
  }

  void removeUser() async {
    final SharedPreferences prefs = await _sharedPreferences;

    prefs.remove(userKey);
  }
}
