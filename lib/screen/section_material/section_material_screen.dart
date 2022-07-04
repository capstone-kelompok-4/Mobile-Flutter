import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/screen/section_quiz/section_quiz_screen.dart';
import 'package:lms/utils/data_converter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants/styles.dart';
import '../../data/model/course_detail/course_detail_model.dart';

class SectionMaterialScreen extends StatefulWidget {
  static const String routeName = '/section_material_screen';
  final CourseDetailDataSection section;
  const SectionMaterialScreen({Key? key, required this.section}) : super(key: key);

  @override
  State<SectionMaterialScreen> createState() => _SectionMaterialScreenState();
}

class _SectionMaterialScreenState extends State<SectionMaterialScreen> {
  CourseDetailDataSectionMaterial? material;
  late WebViewController _webController;
  final ScrollController _scrollController = ScrollController();
  double _percentageScroll = 0;

  @override
  void initState() {
    final searchMaterial = widget.section.materials.where((material) => material.type == "SLIDE");

    if (searchMaterial.isNotEmpty) {
      material = searchMaterial.first;
    }

    _scrollController.addListener(() {
      setState(() {
        _percentageScroll = DataConverter.convertValueInRangeToPercentage(
          _scrollController.position.maxScrollExtent,
          _scrollController.position.pixels,
          100,
        );
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyleWhite);
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _webController.getScrollY().asStream().listen((event) {
        print(event);
      });
    });

    super.didChangeDependencies();
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
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
                  child: Text(
                    "Materi - ${widget.section.name}",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: colorTextBlue,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            )),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration:
            const BoxDecoration(border: Border(top: BorderSide(color: colorGreyLow, width: 3))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SectionQuizScreen.routeName,
                    arguments: widget.section);
              },
              child: Row(
                children: [
                  Text(
                    "Quiz",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: colorTextBlue,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Image.asset("assets/images/arrow_right_circle.png"),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: size.width < 500 ? 300 : double.infinity,
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
