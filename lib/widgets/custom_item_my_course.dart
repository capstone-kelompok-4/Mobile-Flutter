import 'package:flutter/material.dart';
import 'package:lms/data/model/my_course_model.dart';
import 'package:lms/screen/preview_course/preview_course_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constants/styles.dart';

class CustomItemMyCourse extends StatelessWidget {
  final DataMyCourse myCourse;
  final Color color;
  const CustomItemMyCourse({Key? key, required this.myCourse, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, PreviewCourseScreen.routeName, arguments: myCourse),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox.fromSize(
                size: const Size(92, 112),
                child: Image.asset("assets/images/${myCourse.image}"),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    myCourse.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 14, color: colorTextBlue, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width * .35,
                    padding: EdgeInsets.zero,
                    progressColor: color,
                    backgroundColor: colorBlueDark,
                    barRadius: const Radius.circular(10),
                    percent: myCourse.progress / 100,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Complete: ",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: colorTextBlue, fontSize: 12),
                      children: [
                        TextSpan(
                          text: "${myCourse.progress}%",
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: colorTextBlue, fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
