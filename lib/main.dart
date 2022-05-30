import 'package:flutter/material.dart';
import 'package:lms/screen/empty_screen.dart';
import 'package:lms/screen/forgot_password/forgot_password_screen.dart';
import 'package:lms/screen/login/login_screen.dart';
import 'package:lms/screen/login/login_view_model.dart';
import 'package:lms/screen/register/register_screen.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: LoginScreen.routeName,
        onGenerateRoute: (setting) {
          if (setting.name == SplashScreen.routeName) {
            return PageRouteFadeTransition(
              const LoginScreen(),
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

          return PageRouteFadeTransition(
            const EmptyScreen(),
          );
        },
      ),
    );
  }
}
