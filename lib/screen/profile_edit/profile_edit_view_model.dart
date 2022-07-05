import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/api/api_service.dart';
import '../../data/model/user/user_model.dart';
import '../../data/preferences/user_preference.dart';
import '../../utils/get_connection.dart';
import '../../utils/result_state.dart';

class ProfileEditViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final GetConnection _getConnection = GetConnection();
  final UserPreference _userPreference = UserPreference();
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  ResultState _state = ResultState.none;
  ResultState get state => _state;

  Future<UserDataModel?> editProfile(
      int id, String name, String phone, XFile? image, UserDataAddress address) async {
    changeState(ResultState.loading);
    try {
      final connection = await _getConnection.getConnection();
      String urlImage = "";

      if (!connection) {
        changeState(ResultState.error);
        return null;
      }

      if (image != null) {
        File file = File(image.path);
        String ext = image.name.split(".").last;

        await firebaseStorage.ref('$id/profile.$ext').putFile(file);

        urlImage = await firebaseStorage.ref('$id/profile.$ext').getDownloadURL();
      }

      final token = await _userPreference.getUserToken;
      final result = await _apiService.editProfile(token, name, phone, urlImage, address);

      if (result.data == null) {
        changeState(ResultState.error);
        return result.data;
      }

      _userPreference.setUser(result.data!);

      changeState(ResultState.hasData);
      return result.data;
    } catch (e) {
      changeState(ResultState.error);
      return null;
    }
  }

  void changeState(ResultState s) {
    _state = s;
    notifyListeners();
  }
}
