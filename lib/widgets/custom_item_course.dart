import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../constants/styles.dart';
import '../data/model/course_detail/course_detail_model.dart';
import '../screen/detail_course/detail_course_screen.dart';
import '../screen/detail_course/detail_course_view_model.dart';
import '../utils/course_type_state.dart';

class CustomItemCourse extends StatelessWidget {
  final CourseDetailData myCourse;
  final Color color;

  const CustomItemCourse({Key? key, required this.myCourse, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final DetailCourseViewModel detailCourseViewModel =
            Provider.of<DetailCourseViewModel>(context, listen: false);
        detailCourseViewModel.changeCourseType(CourseTypeState.preview);

        Navigator.pushNamed(context, DetailCourseScreen.routeName, arguments: myCourse.id);
      },
      child: Container(
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
                  child: myCourse.bannerUrl != null || myCourse.bannerUrl!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: myCourse.bannerUrl!,
                          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: colorOrange,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        )
                      : Image.asset("assets/images/course_1.png"),
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
              percent: 40 / 100,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Complete: 40%",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: colorTextBlue, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
