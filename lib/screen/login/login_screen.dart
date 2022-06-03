import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lms/screen/forgot_password/forgot_password_screen.dart';
import 'package:lms/widgets/custom_notification_snackbar.dart';
import 'package:string_validator/string_validator.dart';

import '../../constants/styles.dart';

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

  void _login() {
    if (_formKey.currentState!.validate()) {
      CustomNotificationSnackbar(context: context, message: "login");
    }
  }

  @override
  void initState() {
    // Provider.of<LoginViewModel>(context, listen: false).login("email", "password");

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
      backgroundColor: grey400,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "LOGIN",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
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
                          fontSize: 12.0,
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
                      fillColor: Colors.grey[350],
                      filled: true,
                      hintText: "12345678@corporate.com",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey[500],
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
                          fontSize: 12.0,
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
                      fillColor: Colors.grey[350],
                      filled: true,
                      hintText: "Password..",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
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
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Password wajib diisi";
                      }

                      if (value.length < 6) {
                        return "Password tidak boleh kurang dari 6 karakter";
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
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey[350],
                            shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
                        child: Text(
                          "Login",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                        )),
                  ),
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
