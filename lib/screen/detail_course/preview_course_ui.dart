import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lms/screen/course/course_view_model.dart';
import 'package:lms/screen/detail_course/detail_course_view_model.dart';
import 'package:lms/utils/course_type_state.dart';
import 'package:lms/utils/result_state.dart';
import 'package:lms/widgets/custom_notification_snackbar.dart';
import 'package:provider/provider.dart';

import '../../constants/styles.dart';
import '../../data/model/course_detail/course_detail_model.dart';

class PreviewCourseUI extends StatefulWidget {
  final CourseDetailData course;
  const PreviewCourseUI({Key? key, required this.course}) : super(key: key);

  @override
  State<PreviewCourseUI> createState() => _PreviewCourseUIState();
}

class _PreviewCourseUIState extends State<PreviewCourseUI> {
  double rate = 1.0;

  Future<void> _editRating(int idCourseTaken) async {
    final DetailCourseViewModel detailCourseViewModel =
        Provider.of<DetailCourseViewModel>(context, listen: false);
    final CourseViewModel courseViewModel = Provider.of<CourseViewModel>(context, listen: false);
    final navigator = Navigator.of(context);

    final result = await detailCourseViewModel.editRating(idCourseTaken, rate);

    if (!result) {
      CustomNotificationSnackbar(context: context, message: "Rating gagal disimpan");
      navigator.pop();
      return;
    }

    CustomNotificationSnackbar(context: context, message: "Rating berhasil diberikan");
    navigator.pop();
    await courseViewModel.getCourseTaken();
    await courseViewModel.getAllCourses();
  }

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
              Consumer2<DetailCourseViewModel, CourseViewModel>(
                  builder: (context, model1, model2, child) {
                final searchMyCourse =
                    model2.myCourses.where((course) => course.course.id == widget.course.id);

                if (searchMyCourse.isNotEmpty) {
                  model1.changeCourseTaken(searchMyCourse.first);
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox.fromSize(
                          size: const Size(20, 15),
                          child: Image.asset("assets/images/icon_book.png"),
                        ),
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
                    if (model1.courseTypeState == CourseTypeState.preview)
                      const SizedBox(
                        width: 8.0,
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
                          model1.courseTaken?.rate != null
                              ? "${model1.courseTaken?.rate ?? 0.0}"
                              : "${widget.course.rate ?? 0.0}",
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 12, color: colorTextBlue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    if (model1.courseTypeState == CourseTypeState.preview)
                      const SizedBox(
                        width: 8.0,
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
                    ),
                    if (model1.courseTypeState == CourseTypeState.preview) const Spacer(),
                    if (model1.courseTypeState == CourseTypeState.preview)
                      ElevatedButton(
                        onPressed: model1.courseTaken!.rate != null
                            ? null
                            : () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10.0),
                                    ),
                                  ),
                                  builder: (context) =>
                                      StatefulBuilder(builder: (context, setModalState) {
                                    return Consumer<DetailCourseViewModel>(
                                        builder: (context, modelDetail, child) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          RatingBar.builder(
                                            initialRating: modelDetail.courseTaken?.rate != null
                                                ? modelDetail.courseTaken!.rate!
                                                : 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(horizontal: 4.0),
                                            itemBuilder: (context, _) => const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              setState(() => rate = rating);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          ElevatedButton(
                                            onPressed:
                                                modelDetail.stateRating == ResultState.loading
                                                    ? null
                                                    : () {
                                                        if (modelDetail.courseTaken != null) {
                                                          _editRating(modelDetail.courseTaken!.id);
                                                        }
                                                      },
                                            style: ElevatedButton.styleFrom(
                                                primary: colorBlueDark,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8.0))),
                                            child: Text(
                                              "Save",
                                              style:
                                                  Theme.of(context).textTheme.subtitle2!.copyWith(
                                                        color: Colors.white,
                                                      ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          if (model1.stateRating == ResultState.loading)
                                            const LinearProgressIndicator(
                                              color: colorOrange,
                                              backgroundColor: colorGreyLow,
                                            ),
                                        ],
                                      );
                                    });
                                  }),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          primary: colorOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          "Add Rating",
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                  ],
                );
              }),
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
                itemCount: widget.course.targetLearner.length,
                itemBuilder: (context, index) {
                  final item = widget.course.targetLearner[index];
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
                itemCount: widget.course.objectiveLearner.length,
                itemBuilder: (context, index) {
                  final item = widget.course.objectiveLearner[index];
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
                children: widget.course.methodologyLearnings
                    .map(
                      (item) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: colorBlueDark,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Text(
                          item.replaceAll("_", " "),
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
