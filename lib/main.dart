import 'package:flutter/material.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/data/model/my_course_model.dart';
import 'package:lms/screen/course/course_view_model.dart';
import 'package:lms/screen/forgot_password/forgot_password_screen.dart';
import 'package:lms/screen/home/home_view_model.dart';
import 'package:lms/screen/login/login_screen.dart';
import 'package:lms/screen/login/login_view_model.dart';
import 'package:lms/screen/main/main_screen.dart';
import 'package:lms/screen/main/main_view_model.dart';
import 'package:lms/screen/on_boarding/on_boarding_screen.dart';
import 'package:lms/screen/preview_course/preview_course_screen.dart';
import 'package:lms/screen/register/register_screen.dart';
import 'package:lms/screen/section_quiz/section_quiz_screen.dart';
import 'package:lms/screen/section_quiz/section_quiz_view_model.dart';
import 'package:lms/screen/section_video/section_video_screen.dart';
import 'package:lms/screen/section_video/section_video_view_model.dart';
import 'package:lms/screen/splash/splash_screen.dart';
import 'package:lms/utils/page_route_fade_transition.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => MainViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => CourseViewModel()),
        ChangeNotifierProvider(create: (context) => SectionVideoViewModel()),
        ChangeNotifierProvider(create: (context) => SectionQuizViewModel()),
      ],
      child: MaterialApp(
        title: 'Learning Management System',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        initialRoute: OnBoardingScreen.routeName,
        onGenerateRoute: (setting) {
          if (setting.name == SplashScreen.routeName) {
            return PageRouteFadeTransition(
              const SplashScreen(),
            );
          }
          if (setting.name == OnBoardingScreen.routeName) {
            return PageRouteFadeTransition(
              const OnBoardingScreen(),
            );
          }
          if (setting.name == LoginScreen.routeName) {
            return PageRouteFadeTransition(
              const LoginScreen(),
            );
          }
          if (setting.name == RegisterScreen.routeName) {
            return PageRouteFadeTransition(
              const RegisterScreen(),
            );
          }
          if (setting.name == ForgotPasswordScreen.routeName) {
            return PageRouteFadeTransition(
              const ForgotPasswordScreen(),
            );
          }
          if (setting.name == MainScreen.routeName) {
            return PageRouteFadeTransition(
              const MainScreen(),
            );
          }
          if (setting.name == PreviewCourseScreen.routeName) {
            return PageRouteFadeTransition(
              PreviewCourseScreen(myCourse: setting.arguments as DataMyCourse),
            );
          }
          if (setting.name == SectionVideoScreen.routeName) {
            return PageRouteFadeTransition(
              const SectionVideoScreen(),
            );
          }
          if (setting.name == SectionQuizScreen.routeName) {
            return PageRouteFadeTransition(
              const SectionQuizScreen(),
            );
          }

          return null;
        },
      ),
    );
  }
}
