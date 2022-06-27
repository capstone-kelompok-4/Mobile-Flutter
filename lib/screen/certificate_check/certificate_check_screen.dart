import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../widgets/custom_notification_snackbar.dart';

class CertificateCheckScreen extends StatefulWidget {
  static const String routeName = '/certificate_check_screen';
  const CertificateCheckScreen({Key? key}) : super(key: key);

  @override
  State<CertificateCheckScreen> createState() => _CertificateCheckScreenState();
}

class _CertificateCheckScreenState extends State<CertificateCheckScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _checkCertificateController = TextEditingController();

  void _checkCertificate() {
    if (_formKey.currentState!.validate()) {
      CustomNotificationSnackbar(context: context, message: "Notifikasi certificate");
    }
  }

  @override
  void dispose() {
    _checkCertificateController.dispose();

    super.dispose();
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
          "Check Certificate",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: colorTextBlue,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _checkCertificateController,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.send,
                  onFieldSubmitted: (_) => _checkCertificate(),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter certification code",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    suffixIcon: ElevatedButton(
                      onPressed: () => _checkCertificate(),
                      style: ElevatedButton.styleFrom(
                        primary: colorOrange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Text(
                        "Check Code",
                        style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
