import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/constants/styles.dart';
import 'package:string_validator/string_validator.dart';

import '../../widgets/custom_notification_snackbar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = '/forgot_password_screen';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void _forgotPassword() {
    if (_formKey.currentState!.validate()) {
      CustomNotificationSnackbar(context: context, message: "login");
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Back to Login",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: colorTextBlue,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "FORGOT PASSWORD",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: colorTextBlue,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    "Please enter your email correctly and we will send you a link where you can change your password.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: colorTextBlue,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Your email",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: colorTextBlue,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
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
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: (_) => _forgotPassword(),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "12345678@corporate.com",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: colorBlueDark),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: colorBlueDark),
                          borderRadius: BorderRadius.circular(16.0),
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
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _forgotPassword(),
                        style: ElevatedButton.styleFrom(
                          primary: colorOrange,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        child: Text(
                          "Send Reset Link",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
