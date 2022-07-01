import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constants/styles.dart';
import '../data/model/course_detail_model.dart';

class CustomItemCourse extends StatelessWidget {
  final DataMyCourse myCourse;
  final Color color;

  const CustomItemCourse({Key? key, required this.myCourse, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: colorGreyLow),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
              child: SizedBox.fromSize(
                size: Size(MediaQuery.of(context).size.width / 2 - 20, 80),
                child: Image.asset(
                  "assets/images/${myCourse.image}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Text(
              myCourse.name,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: colorTextBlue,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          LinearPercentIndicator(
            lineHeight: 3.0,
            padding: EdgeInsets.zero,
            progressColor: colorBlueDark,
            backgroundColor: colorGreyLow,
            barRadius: const Radius.circular(10),
            percent: myCourse.progress / 100,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Complete: ${myCourse.progress}%",
            style:
                Theme.of(context).textTheme.subtitle2!.copyWith(color: colorTextBlue, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
