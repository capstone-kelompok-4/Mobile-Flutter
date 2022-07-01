import 'package:flutter/material.dart';
import 'package:lms/data/model/course_detail_model.dart';
import 'package:lms/screen/detail_course/detail_course_view_model.dart';
import 'package:lms/utils/course_type_state.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../constants/styles.dart';
import '../screen/detail_course/detail_course_screen.dart';

class CustomItemMyCourse extends StatelessWidget {
  final DataMyCourse myCourse;
  const CustomItemMyCourse({Key? key, required this.myCourse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final DetailCourseViewModel detailCourseViewModel =
            Provider.of<DetailCourseViewModel>(context, listen: false);
        detailCourseViewModel.changeCourseType(CourseTypeState.request);

        Navigator.pushNamed(context, DetailCourseScreen.routeName, arguments: myCourse);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: colorGreyLow),
          borderRadius: BorderRadius.circular(6.0),
        ),
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
                    lineHeight: 6.0,
                    padding: EdgeInsets.zero,
                    progressColor: colorBlueDark,
                    backgroundColor: colorGreyLow,
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
