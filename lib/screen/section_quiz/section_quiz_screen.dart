import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants/styles.dart';
import '../../data/model/course_detail/course_detail_model.dart';

class SectionQuizScreen extends StatefulWidget {
  static const String routeName = '/section_quiz_screen';
  final CourseDetailDataSection section;
  const SectionQuizScreen({Key? key, required this.section}) : super(key: key);

  @override
  State<SectionQuizScreen> createState() => _SectionQuizScreenState();
}

class _SectionQuizScreenState extends State<SectionQuizScreen> {
  CourseDetailDataSectionMaterial? material;
  late WebViewController _webController;

  @override
  void initState() {
    final searchMaterial = widget.section.materials.where((material) => material.type == "QUIZ");

    if (searchMaterial.isNotEmpty) {
      material = searchMaterial.first;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyleWhite);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 3.0,
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Section ${widget.section.id}",
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: colorOrange,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              widget.section.name,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: colorTextBlue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 10, right: 26, bottom: 10),
            child: ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                primary: colorOrange,
                onSurface: colorBlueDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Akhiri Quiz",
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: WebView(
          initialUrl: material?.url ??
              "https://docs.google.com/presentation/d/e/2PACX-1vSneupNyKmSiV9_7xSdfAL2lBQLTMm9bR0NWUDfycEUtjfx7AE0cwz2pTw_z8LkV1dYVr9o4rfoql1O/embed?frameborder=&slide=id.g1081a60370a_0_134",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _webController = controller;
          },
          onPageStarted: (url) {
            print('onload: $url');
          },
        ),
      ),
    );
  }
}
