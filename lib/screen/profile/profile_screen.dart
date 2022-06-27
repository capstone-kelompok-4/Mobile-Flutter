import 'package:flutter/material.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/screen/certificate/certificate_screen.dart';
import 'package:lms/screen/certificate_check/certificate_check_screen.dart';
import 'package:lms/screen/faq/faq_screen.dart';
import 'package:lms/screen/login/login_screen.dart';
import 'package:lms/screen/profile_change_password/profile_change_password_screen.dart';
import 'package:lms/screen/profile_edit/profile_edit_screen.dart';
import 'package:lms/screen/tos/tos_screen.dart';
import 'package:lms/widgets/custom_notification_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorGrey,
                colorBlueDark.withOpacity(.68),
                colorBlueDark.withOpacity(.88),
                colorBlueDark,
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "PROFILE",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfileEditScreen.routeName);
            },
            icon: Image.asset("assets/images/icon_edit.png"),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 170),
          child: Column(
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size(85, 85),
                  child: Image.asset("assets/images/avatar_example_1.png"),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Dave Christian",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                "Designer",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              children: [
                ListTile(
                  onTap: () => Navigator.pushNamed(context, ProfileChangePassword.routeName),
                  leading: Image.asset(
                    "assets/images/icon_key.png",
                  ),
                  horizontalTitleGap: 0,
                  title: Text(
                    "Change Password",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorBlueDark, fontWeight: FontWeight.w600),
                  ),
                ),
                const Divider(
                  indent: 20,
                  color: colorGrey,
                ),
                ListTile(
                  onTap: () => Navigator.pushNamed(context, CertificateScreen.routeName),
                  leading: Image.asset(
                    "assets/images/icon_certificate.png",
                  ),
                  horizontalTitleGap: 0,
                  title: Text(
                    "Certificate",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorBlueDark, fontWeight: FontWeight.w600),
                  ),
                ),
                const Divider(
                  indent: 20,
                  color: colorGrey,
                ),
                ListTile(
                  onTap: () => Navigator.pushNamed(context, CertificateCheckScreen.routeName),
                  leading: Image.asset(
                    "assets/images/icon_badge_verified.png",
                  ),
                  horizontalTitleGap: 0,
                  title: Text(
                    "Cek Certificate",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorBlueDark, fontWeight: FontWeight.w600),
                  ),
                ),
                const Divider(
                  indent: 20,
                  color: colorGrey,
                ),
                ListTile(
                  onTap: () => Navigator.pushNamed(context, FaqScreen.routeName),
                  leading: Image.asset(
                    "assets/images/icon_faq.png",
                  ),
                  horizontalTitleGap: 0,
                  title: Text(
                    "FAQ",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorBlueDark, fontWeight: FontWeight.w600),
                  ),
                ),
                const Divider(
                  indent: 20,
                  color: colorGrey,
                ),
                ListTile(
                  onTap: () => Navigator.pushNamed(context, TosScreen.routeName),
                  leading: Image.asset(
                    "assets/images/icon_list.png",
                  ),
                  horizontalTitleGap: 0,
                  title: Text(
                    "Syarat dan Ketentuan",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorBlueDark, fontWeight: FontWeight.w600),
                  ),
                ),
                const Divider(
                  indent: 20,
                  color: colorGrey,
                ),
                ListTile(
                  onTap: () async {
                    final Uri uri = Uri(
                      scheme: 'http',
                      host: 'wa.me',
                      path: "6282110044605",
                      queryParameters: {
                        "text": "Halo, saya ingin bertanya tentang Alterra Academy"
                      },
                    );
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      CustomNotificationSnackbar(
                          context: context,
                          message: "Device anda tidak support untuk membuka link");
                    }
                  },
                  leading: Image.asset(
                    "assets/images/icon_message.png",
                  ),
                  horizontalTitleGap: 0,
                  title: Text(
                    "Butuh bantuan? Hubungi Kami",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorBlueDark, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const Divider(
              color: colorGreyLow,
              thickness: 8,
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              children: [
                ListTile(
                  onTap: () => Navigator.pushReplacementNamed(context, LoginScreen.routeName),
                  leading: Image.asset(
                    "assets/images/icon_logout.png",
                  ),
                  horizontalTitleGap: 0,
                  title: Text(
                    "Logout",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorOrange, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
