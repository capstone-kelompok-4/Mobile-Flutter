import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/data/model/course_detail/course_detail_model.dart';
import 'package:lms/screen/certificate/certificate_screen.dart';
import 'package:lms/screen/certificate_check/certificate_check_screen.dart';
import 'package:lms/screen/course/course_view_model.dart';
import 'package:lms/screen/course_request_form/course_request_form_screen.dart';
import 'package:lms/screen/detail_course/detail_course_screen.dart';
import 'package:lms/screen/detail_course/detail_course_view_model.dart';
import 'package:lms/screen/faq/faq_screen.dart';
import 'package:lms/screen/faq/faq_view_model.dart';
import 'package:lms/screen/forgot_password/forgot_password_screen.dart';
import 'package:lms/screen/home/home_view_model.dart';
import 'package:lms/screen/login/login_screen.dart';
import 'package:lms/screen/login/login_view_model.dart';
import 'package:lms/screen/main/main_screen.dart';
import 'package:lms/screen/main/main_view_model.dart';
import 'package:lms/screen/on_boarding/on_boarding_screen.dart';
import 'package:lms/screen/profile/profile_view_model.dart';
import 'package:lms/screen/profile_change_password/profile_change_password_screen.dart';
import 'package:lms/screen/profile_edit/profile_edit_screen.dart';
import 'package:lms/screen/profile_edit/profile_edit_view_model.dart';
import 'package:lms/screen/register/register_screen.dart';
import 'package:lms/screen/section_material/section_material_screen.dart';
import 'package:lms/screen/section_quiz/section_quiz_screen.dart';
import 'package:lms/screen/section_quiz/section_quiz_view_model.dart';
import 'package:lms/screen/section_video/section_video_screen.dart';
import 'package:lms/screen/section_video/section_video_view_model.dart';
import 'package:lms/screen/splash/splash_screen.dart';
import 'package:lms/screen/tos/tos_screen.dart';
import 'package:lms/utils/page_route_fade_transition.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        ChangeNotifierProvider(create: (context) => DetailCourseViewModel()),
        ChangeNotifierProvider(create: (context) => ProfileViewModel()),
        ChangeNotifierProvider(create: (context) => ProfileEditViewModel()),
        ChangeNotifierProvider(create: (context) => FaqViewModel()),
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
          if (setting.name == DetailCourseScreen.routeName) {
            return PageRouteFadeTransition(
              DetailCourseScreen(id: setting.arguments as int),
            );
          }
          if (setting.name == SectionVideoScreen.routeName) {
            return PageRouteFadeTransition(
              SectionVideoScreen(
                section: setting.arguments as CourseDetailDataSection,
              ),
            );
          }
          if (setting.name == SectionMaterialScreen.routeName) {
            return PageRouteFadeTransition(
              SectionMaterialScreen(
                section: setting.arguments as CourseDetailDataSection,
              ),
            );
          }
          if (setting.name == SectionQuizScreen.routeName) {
            return PageRouteFadeTransition(
              SectionQuizScreen(
                section: setting.arguments as CourseDetailDataSection,
              ),
            );
          }
          if (setting.name == CourseRequestFormScreen.routeName) {
            return PageRouteFadeTransition(
              const CourseRequestFormScreen(),
            );
          }
          if (setting.name == ProfileEditScreen.routeName) {
            return PageRouteFadeTransition(
              const ProfileEditScreen(),
            );
          }
          if (setting.name == ProfileChangePassword.routeName) {
            return PageRouteFadeTransition(
              const ProfileChangePassword(),
            );
          }
          if (setting.name == CertificateScreen.routeName) {
            return PageRouteFadeTransition(
              const CertificateScreen(),
            );
          }
          if (setting.name == CertificateCheckScreen.routeName) {
            return PageRouteFadeTransition(
              const CertificateCheckScreen(),
            );
          }
          if (setting.name == FaqScreen.routeName) {
            return PageRouteFadeTransition(
              const FaqScreen(),
            );
          }
          if (setting.name == TosScreen.routeName) {
            return PageRouteFadeTransition(
              const TosScreen(),
            );
          }

          return null;
        },
      ),
    );
  }
}
