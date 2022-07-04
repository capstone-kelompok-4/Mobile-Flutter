import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/screen/course_request_form/course_request_form_screen.dart';
import 'package:lms/screen/detail_course/detail_course_view_model.dart';
import 'package:lms/screen/detail_course/learning_course_ui.dart';
import 'package:lms/screen/detail_course/preview_course_ui.dart';
import 'package:lms/screen/empty_screen.dart';
import 'package:lms/utils/course_type_state.dart';
import 'package:lms/utils/result_state.dart';
import 'package:provider/provider.dart';

class DetailCourseScreen extends StatefulWidget {
  static const String routeName = '/detail_course_screen';
  final int id;
  const DetailCourseScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyleWhite);
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final DetailCourseViewModel detailCourseViewModel =
          Provider.of<DetailCourseViewModel>(context, listen: false);

      detailCourseViewModel.getDetailCourse(widget.id);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorGreyLow,
        bottomNavigationBar: Consumer<DetailCourseViewModel>(builder: (context, model, child) {
          if (model.courseTypeState == CourseTypeState.preview ||
              model.courseTypeState == CourseTypeState.request) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              color: Colors.white,
              child: ElevatedButton(
                onPressed: () {
                  final DetailCourseViewModel detailCourseViewModel =
                      Provider.of<DetailCourseViewModel>(context, listen: false);
                  if (model.courseTypeState == CourseTypeState.preview) {
                    detailCourseViewModel.changeCourseType(CourseTypeState.learning);
                  } else {
                    Navigator.pushNamed(context, CourseRequestFormScreen.routeName);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: colorOrange,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                child: Text(
                  model.courseTypeState == CourseTypeState.preview
                      ? "Mulai Belajar"
                      : "Send Request",
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            );
          }

          return const SizedBox();
        }),
        body: Consumer<DetailCourseViewModel>(builder: (context, model, child) {
          if (model.state == ResultState.none) {
            return const SizedBox();
          }

          if (model.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (model.state == ResultState.error) {
            return const Center(
              child: Text("Terjadi kesalahan"),
            );
          }

          final course = model.course;

          return NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                automaticallyImplyLeading: true,
                shadowColor: Colors.black,
                elevation: 3.0,
                floating: true,
                pinned: true,
                snap: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 74.0),
                  expandedTitleScale: 1.4,
                  title: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
                    child: Text(
                      course.name,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontSize: 14,
                            color: colorTextBlue,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  background: Image.asset(
                    "assets/images/banner_course_1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                leading: Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: colorBlueDark, borderRadius: BorderRadius.circular(50.0)),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
            body: SingleChildScrollView(
                child: Consumer<DetailCourseViewModel>(builder: (context, model, child) {
              if (model.courseTypeState == CourseTypeState.preview ||
                  model.courseTypeState == CourseTypeState.request) {
                return PreviewCourseUI(course: course);
              }
              if (model.courseTypeState == CourseTypeState.learning) {
                return LearningCourseUI(course: course);
              }
              return const EmptyScreen();
            })),
          );
        }));
  }
}
