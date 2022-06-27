import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class TosScreen extends StatelessWidget {
  static const String routeName = '/tos_screen';
  const TosScreen({Key? key}) : super(key: key);

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
          "Terms & Condition",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: colorTextBlue,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Terms & Conditions",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: colorTextBlue,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Our Privacy Policy aims to explain how we appreciate, use, and collect your personal information which can be identified and obtained from each ongoing process. Every personal information that you submit through Binar Academy’s website, mobile app, or offline activities will be at your own risk. By submitting your personal information to us, you are deemed to have given your consent to the disclosure referred to this policy as required."
                "\n\nThis app is owned and managed by Binar Academy (“Binar”, “we”, “us”, “our”). This privacy policy will be reviewed regularly to make sure they are up-to-date. As a user of our app (“you”, “your”, “customer”, “user”), we encourage you to check this page regularly, to make sure you are up to date with the changes."
                "\n\nThis Privacy Policy is intended to communicate the use of your personal information collected from your visit to our website, mobile app, or offline activities. This Privacy Policy also includes our protection of your information that we share with our business partners, or personal information you provide to us through third party websites. This policy does not apply to websites, apps, and activities that we do not own/organize, or individuals that we do not employ."
                "\n\nBy placing an order on our website or app, over the phone, on email or in person, at an event, we may need to collect your name, email address, phone number, ID number, delivery address, and billing address. Additionally, we may require your debit or credit card details such as your card number, CV2 number and the card’s expiry date. By signing up to our app and newsletter, we will collect your email address, name, location, gender, age, and preferences relevant to our marketing research or products.",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: colorTextBlue,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Personal information you give:",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: colorTextBlue,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Please note: We do not accept any credit or debit card details over an email. If you send us your card details over an email, you will do this at your own risk. This email and any other linking emails that may reveal your card information will be destroyed immediately."
                "\n\nIf you have any questions or requests about our Privacy Policy, please kindly contact us by sending email to info@company.com.",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: colorTextBlue,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
