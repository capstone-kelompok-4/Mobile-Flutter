import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class CertificateScreen extends StatelessWidget {
  static const String routeName = '/certificate_screen';
  const CertificateScreen({Key? key}) : super(key: key);

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
          "Certificate",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: colorTextBlue,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: colorGreyLow),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SizedBox.fromSize(
                      size: const Size(150, 100),
                      child: Image.asset(
                        "assets/images/example_certificate.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Text(
                      "Be The Best Search Quality Engineer",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: colorTextBlue,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.download_for_offline,
                        color: colorOrange,
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
