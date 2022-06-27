import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/styles.dart';
import '../../data/model/course_detail_model.dart';

class SectionQuizScreen extends StatefulWidget {
  static const String routeName = '/section_quiz_screen';
  final DataMaterialCourse section;
  const SectionQuizScreen({Key? key, required this.section}) : super(key: key);

  @override
  State<SectionQuizScreen> createState() => _SectionQuizScreenState();
}

class _SectionQuizScreenState extends State<SectionQuizScreen> {
  bool _valueA = false;
  bool _valueB = false;
  bool _valueC = false;
  bool _valueD = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyleWhite);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: colorBlueDark,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                10,
                (index) => TextButton(
                  onPressed: () {},
                  child: Text(
                    "${index + 1}",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: index == 0 ? colorOrange : Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Manakah yang bukan merupakan software yang digunakan dalam UI/UX...",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: colorTextBlue, fontWeight: FontWeight.bold),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  value: _valueA,
                  onChanged: (value) {
                    setState(() {
                      _valueA = value!;
                    });
                  },
                  title: Text(
                    "Maze",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorTextBlue, fontWeight: FontWeight.bold),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  value: _valueB,
                  onChanged: (value) {
                    setState(() {
                      _valueB = value!;
                    });
                  },
                  title: Text(
                    "React",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorTextBlue, fontWeight: FontWeight.bold),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  value: _valueC,
                  onChanged: (value) {
                    setState(() {
                      _valueC = value!;
                    });
                  },
                  title: Text(
                    "Zeplin",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorTextBlue, fontWeight: FontWeight.bold),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  value: _valueD,
                  onChanged: (value) {
                    setState(() {
                      _valueD = value!;
                    });
                  },
                  title: Text(
                    "Figma",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorTextBlue, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        primary: colorOrange,
                        onSurface: colorBlueDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Back",
                        style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: colorOrange,
                        onSurface: colorBlueDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
