import 'package:flutter/material.dart';
import 'package:lms/constants/styles.dart';

class CustomNotificationSnackbar {
  final BuildContext context;
  final String message;
  final String? actionLabel;
  final Function()? action;

  CustomNotificationSnackbar(
      {required this.context, required this.message, this.actionLabel, this.action}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: colorBlueDark,
      action: actionLabel == null
          ? null
          : SnackBarAction(label: actionLabel!, textColor: Colors.white, onPressed: action!),
    ));
  }
}
