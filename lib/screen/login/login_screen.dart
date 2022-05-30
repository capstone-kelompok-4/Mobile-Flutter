import 'package:flutter/material.dart';
import 'package:lms/screen/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Provider.of<LoginViewModel>(context, listen: false).login("email", "password");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
