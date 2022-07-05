import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/login/login_screen.dart';
import '../screen/login/login_view_model.dart';
import '../screen/profile/profile_view_model.dart';
import '../widgets/custom_notification_snackbar.dart';

class CheckUser {
  static Future<bool> isLogin(BuildContext context) async {
    final LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    final ProfileViewModel profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);

    final navigator = Navigator.of(context);

    final getUser = await loginViewModel.getUser();

    if (getUser == null) {
      profileViewModel.logout();
      CustomNotificationSnackbar(context: context, message: "Waktu sesi habis!");
      navigator.pushReplacementNamed(LoginScreen.routeName);
      return false;
    }

    return true;
  }
}
