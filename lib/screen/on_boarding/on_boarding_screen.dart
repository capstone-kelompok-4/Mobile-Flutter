import 'package:flutter/material.dart';
import 'package:lms/screen/login/login_screen.dart';

import '../../constants/styles.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = '/on_boarding_screen';
  const OnBoardingScreen({Key? key}) : super(key: key);

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
                width: 270,
                height: 400,
                child: Center(
                  child: Image.asset(
                    "assets/images/people_opening_laptop.png",
                    scale: 0.5,
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
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
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
