import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/screen/forgot_password/forgot_password_screen.dart';
import 'package:lms/screen/login/login_view_model.dart';
import 'package:lms/screen/main/main_screen.dart';
import 'package:lms/utils/result_state.dart';
import 'package:lms/widgets/custom_notification_snackbar.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isRememberMe = false;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
      final navigator = Navigator.of(context);

      final result = await loginViewModel.login(_emailController.text, _passwordController.text);

      if (result.token == null) {
        CustomNotificationSnackbar(context: context, message: "Email atau password salah");
        return;
      }

      CustomNotificationSnackbar(context: context, message: result.token!);
      navigator.pushReplacementNamed(MainScreen.routeName);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyleWhite);
    });

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Center(
                    child: Text(
                      "LOGIN",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Your email",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _emailController,
                    autocorrect: false,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "12345678@corporate.com",
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey[500],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Email wajib diisi";
                      }

                      if (value.length < 6) {
                        return "Email tidak boleh kurang dari 6 karakter";
                      }

                      if (!isEmail(value)) {
                        return "Email tidak valid";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    autocorrect: false,
                    maxLines: 1,
                    obscureText: !_isPasswordVisible,
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted: (_) => _login(),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password..",
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.grey[500],
                      ),
                      suffixIcon: IconButton(
                        alignment: Alignment.centerLeft,
                        icon: _isPasswordVisible
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                        color: Colors.grey[500],
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Password wajib diisi";
                      }

                      if (value.length < 5) {
                        return "Password tidak boleh kurang dari 5 karakter";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CheckboxListTile(
                    value: _isRememberMe,
                    onChanged: (value) {
                      setState(() {
                        _isRememberMe = !_isRememberMe;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text("Remember me"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _login(),
                      style: ElevatedButton.styleFrom(
                        primary: colorOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Consumer<LoginViewModel>(builder: (context, model, child) {
                    if (model.state == ResultState.loading) {
                      return const LinearProgressIndicator(
                        color: colorOrange,
                        backgroundColor: colorGreyLow,
                      );
                    }

                    return const SizedBox();
                  }),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Forgot your password?',
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.black,
                              ),
                          children: [
                            TextSpan(
                                text: ' Reset',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      Navigator.pushNamed(context, ForgotPasswordScreen.routeName)),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
