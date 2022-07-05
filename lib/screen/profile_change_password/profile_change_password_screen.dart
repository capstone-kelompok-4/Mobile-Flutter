import 'package:flutter/material.dart';
import 'package:lms/screen/profile_change_password/profile_change_password_view_model.dart';
import 'package:lms/widgets/custom_notification_snackbar.dart';
import 'package:provider/provider.dart';

import '../../constants/styles.dart';
import '../../utils/check_user.dart';
import '../../utils/result_state.dart';

class ProfileChangePassword extends StatefulWidget {
  static const String routeName = '/profile_change_password_screen';
  const ProfileChangePassword({Key? key}) : super(key: key);

  @override
  State<ProfileChangePassword> createState() => _ProfileChangePasswordState();
}

class _ProfileChangePasswordState extends State<ProfileChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _changePassword() async {
    if (_formKey.currentState!.validate()) {
      if (_newPasswordController.text != _confirmPasswordController.text) {
        CustomNotificationSnackbar(
            context: context, message: "Password baru dan konfirmasi password tidak sama");
        return;
      }

      final ProfileChangePasswordViewModel profileChangePasswordViewModel =
          Provider.of(context, listen: false);
      profileChangePasswordViewModel.changeState(ResultState.loading);
      await CheckUser.isLogin(context);

      final result = await profileChangePasswordViewModel.changePassword(
          _currentPasswordController.text, _newPasswordController.text);

      if (result.data == null) {
        CustomNotificationSnackbar(context: context, message: result.message);
        return;
      }

      CustomNotificationSnackbar(context: context, message: "Password berhasil diubah");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(10.0),
          decoration:
              BoxDecoration(color: colorBlueDark, borderRadius: BorderRadius.circular(50.0)),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Change Password",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: colorTextBlue,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      bottomNavigationBar:
          Consumer<ProfileChangePasswordViewModel>(builder: (context, model, child) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: model.state == ResultState.loading ? null : () => _changePassword(),
                  style: ElevatedButton.styleFrom(
                    primary: colorOrange,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: Text(
                    "Simpan",
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              if (model.state == ResultState.loading)
                const LinearProgressIndicator(
                  color: colorOrange,
                  backgroundColor: colorGreyLow,
                ),
            ],
          ),
        );
      }),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Current Password",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: colorTextBlue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _currentPasswordController,
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "•••••••••",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Password saat ini wajib diisi";
                    }

                    if (value.length < 5) {
                      return "Password saat ini tidak boleh kurang dari 5 karakter";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "New Password",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: colorTextBlue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _newPasswordController,
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "•••••••••",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Password baru wajib diisi";
                    }

                    if (value.length < 5) {
                      return "Password baru tidak boleh kurang dari 5 karakter";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Confirm Password",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: colorTextBlue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.send,
                  onFieldSubmitted: (_) => _changePassword(),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "•••••••••",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Konfirmasi password wajib diisi";
                    }

                    if (value.length < 5) {
                      return "Konfirmasi password tidak boleh kurang dari 5 karakter";
                    }

                    if (value != _newPasswordController.text) {
                      return "Password baru dan konfirmasi password tidak sama";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
