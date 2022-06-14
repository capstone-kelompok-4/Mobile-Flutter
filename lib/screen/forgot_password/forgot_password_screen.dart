import 'package:flutter/material.dart';
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
      backgroundColor: grey400,
      appBar: AppBar(
        backgroundColor: grey400,
        title: Text(
          "Forgot Password",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "FORGOT PASSWORD",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
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
                          color: Colors.white,
                          fontSize: 12.0,
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
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: (_) => _forgotPassword(),
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
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: _forgotPassword,
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey[350],
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
                          child: Text(
                            "Send Reset Link",
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                          )),
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
