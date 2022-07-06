import 'package:flutter/material.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/screen/course/course_view_model.dart';
import 'package:lms/screen/login/login_view_model.dart';
import 'package:lms/widgets/custom_item_webinar.dart';
import 'package:provider/provider.dart';

import '../../utils/result_state.dart';
import '../../widgets/custom_item_course.dart';
import '../main/main_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 3.0,
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Image.asset(
            "assets/images/alterra.png",
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: colorBlueDark,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<LoginViewModel>(builder: (context, model, child) {
                      return Expanded(
                          flex: 0,
                          child: RichText(
                            text: TextSpan(
                                text: 'WELCOME ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: colorTextBlue, fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: model.userLogin?.name.toUpperCase() ?? "",
                                    style: Theme.of(context).textTheme.headline6!.copyWith(
                                        color: colorTextBlue, fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: ' 🎉',
                                    style: Theme.of(context).textTheme.headline6!.copyWith(
                                        color: colorTextBlue, fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ));
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        "Satisfy your curiosity with thousands of amazing courses. Upgrade your skills, deepen existing",
                        style:
                            Theme.of(context).textTheme.subtitle2!.copyWith(color: colorTextBlue),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        final MainViewModel mainViewModel =
                            Provider.of<MainViewModel>(context, listen: false);

                        mainViewModel.setIndexBottomNav(1);
                      },
                      style: OutlinedButton.styleFrom(
                        primary: colorOrange,
                        side: const BorderSide(color: colorOrange),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      ),
                      child: Text(
                        "Get's Start'",
                        style: Theme.of(context).textTheme.button!.copyWith(color: colorOrange),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Training",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 16.0,
                      );
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const CustomItemWebinar();
                    }),
              ),
              const SizedBox(
                height: 36.0,
              ),
              Text(
                "Let's continue your progress",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(color: colorOrange),
              ),
              Text(
                "Course History",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer<CourseViewModel>(builder: (context, model, child) {
                if (model.stateMyCourses == ResultState.loading) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: colorOrange,
                        backgroundColor: colorGreyLow,
                      ),
                    ),
                  );
                }

                if (model.stateMyCourses == ResultState.error) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        "Terjadi kesalahan saat memuat data",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: colorTextBlue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }

                return SizedBox(
                  height: 210,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: model.myCourses.length,
                      itemBuilder: (context, index) {
                        final myCourse = model.myCourses[index].course;
                        Color color = colorOrangeLight;
                        if (index % 2 == 0) {
                          color = colorOrangeLight;
                        } else {
                          color = colorBgCourse;
                        }

                        return CustomItemCourse(
                          myCourse: myCourse,
                          color: color,
                        );
                      }),
                );
              }),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
