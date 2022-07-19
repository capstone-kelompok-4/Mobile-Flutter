import 'dart:io';

import 'package:flutter/foundation.dart';

class GetConnection {
  final String _baseUrl = "google.com";

  getConnection() async {
    if (kIsWeb) {
      return true;
    }
    try {
      final result = await InternetAddress.lookup(_baseUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
