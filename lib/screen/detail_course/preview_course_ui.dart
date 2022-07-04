import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../data/model/course_detail/course_detail_model.dart';

class PreviewCourseUI extends StatefulWidget {
  final CourseDetailData course;
  const PreviewCourseUI({Key? key, required this.course}) : super(key: key);

  @override
  State<PreviewCourseUI> createState() => _PreviewCourseUIState();
}

class _PreviewCourseUIState extends State<PreviewCourseUI> {
  final List _listTargetLearner = [
    "Mahasiswa aktif D3/D4/S1, semester 6, 8, 10, 12 atau 14 pada saat pelaksanaan program (Februari - Juli 2022).",
    "Terdaftar sebagai mahasiswa dari Perguruan Tinggi dibawah naungan Kemendikbud Ristek.",
  ];

  final List _listObjectiveLearning = [
    "Memahami prinsip-prinsip dasar User Interface dan User Experience",
    "Mengetahui perbedaan antara UI/UX",
    "Mengetahui profesional path di bidang UI/UX",
    "Dapat mengoperasikan Figma sebagai tool untuk membuat user interface",
  ];

  final List _listMethodologyLearning = [
    "Reading Materials",
    "Video Learning",
    "Flexible Learning",
    "Quiz",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 26.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.course.name,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: colorTextBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox.fromSize(
                          size: const Size(20, 15),
                          child: Image.asset("assets/images/icon_book"
                              ".png")),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "${widget.course.sections.length} Materi",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 12, color: colorTextBlue),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox.fromSize(
                          size: const Size(20, 15),
                          child: Image.asset("assets/images/icon_star.png")),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "${widget.course.rate}",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontSize: 12, color: colorTextBlue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: colorBlueDark,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                    child: Text(
                      "Course",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: widget.course.description,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 12, color: colorTextBlue),
                  children: [
                    TextSpan(
                        text: ' Read more',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 12, color: colorOrange),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ],
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 26.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Target Learner",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: colorTextBlue,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 6.0),
                itemCount: _listTargetLearner.length,
                itemBuilder: (context, index) {
                  final item = _listTargetLearner[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "•",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: colorTextBlue,
                            ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Text(
                          item,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: colorTextBlue,
                              ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                "Objective Learning",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: colorTextBlue,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 6.0),
                itemCount: _listObjectiveLearning.length,
                itemBuilder: (context, index) {
                  final item = _listObjectiveLearning[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "•",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: colorTextBlue,
                            ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Text(
                          item,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: colorTextBlue,
                              ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                "Methodology Learning",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: colorTextBlue,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: _listMethodologyLearning
                    .map(
                      (item) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: colorBlueDark,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Text(
                          item,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
