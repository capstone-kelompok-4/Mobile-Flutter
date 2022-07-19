import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lms/data/model/course_detail/course_detail_model.dart';
import 'package:provider/provider.dart';

import '../constants/styles.dart';
import '../screen/course/course_view_model.dart';
import '../screen/detail_course/detail_course_screen.dart';
import '../screen/detail_course/detail_course_view_model.dart';
import '../utils/course_type_state.dart';

class CustomItemCourseOverview extends StatelessWidget {
  const CustomItemCourseOverview({
    Key? key,
    required this.courseOverview,
  }) : super(key: key);

  final CourseDetailData courseOverview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      decoration: BoxDecoration(border: Border.all(color: colorGreyLow)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Image border
            child: SizedBox.fromSize(
              size: const Size(92, 112),
              child: courseOverview.bannerUrl != null || courseOverview.bannerUrl!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: courseOverview.bannerUrl!,
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
                  courseOverview.name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 14, color: colorTextBlue, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox.fromSize(
                          size: const Size(20, 15),
                          child: Image.asset("assets/images/icon_book.png"),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "${courseOverview.sections.length} Materi",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontSize: 12, color: colorTextBlue),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox.fromSize(
                          size: const Size(20, 15),
                          child: Image.asset("assets/images/icon_star.png"),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "${courseOverview.rate ?? 0.0}",
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 12, color: colorTextBlue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final DetailCourseViewModel detailCourseViewModel =
                          Provider.of<DetailCourseViewModel>(context, listen: false);
                      final CourseViewModel courseViewModel =
                          Provider.of<CourseViewModel>(context, listen: false);

                      final searchMyCourse = courseViewModel.myCourses
                          .where((course) => course.course.id == courseOverview.id);

                      if (searchMyCourse.isNotEmpty) {
                        if (searchMyCourse.first.status == "PENDING") {
                          detailCourseViewModel.changeCourseType(CourseTypeState.waitingApproval);
                        } else {
                          detailCourseViewModel.changeCourseType(CourseTypeState.preview);
                        }
                      } else {
                        detailCourseViewModel.changeCourseType(CourseTypeState.request);
                      }

                      Navigator.pushNamed(context, DetailCourseScreen.routeName,
                          arguments: courseOverview.id);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: colorBlueLight3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    ),
                    child: Text(
                      "Read more",
                      style: Theme.of(context).textTheme.button!.copyWith(color: colorTextBlue),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
