import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/screen/login/login_screen.dart';
import 'package:lms/screen/main/main_screen.dart';
import 'package:provider/provider.dart';

import '../../constants/styles.dart';
import '../login/login_view_model.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/on_boarding_screen';
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyleBlue);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlueDark,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 300,
                child: Center(
                  child: Image.asset(
                    "assets/images/people_opening_laptop.png",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Welcome to Learning Management Corporate!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Tech talent incubator yang memberikan kesempatan bagi banyak individu untuk menjadi tech talent profesional dan berkualitas.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      final LoginViewModel loginViewModel =
                          Provider.of<LoginViewModel>(context, listen: false);
                      final navigator = Navigator.of(context);

                      final result = await loginViewModel.getUserTokenPref();
                      if (result == null) {
                        navigator.pushReplacementNamed(LoginScreen.routeName);
                        return;
                      }

                      navigator.pushReplacementNamed(MainScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: grey200,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                    ),
                    child: Text(
                      "Start",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: colorTextBlue, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
