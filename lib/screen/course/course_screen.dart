import 'package:flutter/material.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/utils/course_state.dart';
import 'package:lms/utils/result_state.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../widgets/custom_item_course_overview.dart';
import '../../widgets/custom_item_my_course.dart';
import 'course_view_model.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    final CourseViewModel courseViewModel = Provider.of<CourseViewModel>(context, listen: false);

    _tabController = TabController(vsync: this, length: 2);
    courseViewModel.changeCourseState(CourseState.myCourse);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

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
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 85),
            child: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              decoration: const BoxDecoration(
                  color: colorBlueDark, borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Consumer<CourseViewModel>(
                builder: (context, model, child) {
                  return DefaultTabController(
                    length: 2,
                    initialIndex: model.courseState == CourseState.myCourse ? 0 : 1,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: colorOrange,
                      unselectedLabelColor: Colors.white,
                      padding: const EdgeInsets.all(6.0),
                      indicator: RectangularIndicator(
                        color: Colors.white,
                        bottomLeftRadius: 15,
                        bottomRightRadius: 15,
                        topLeftRadius: 15,
                        topRightRadius: 15,
                      ),
                      indicatorColor: colorOrange,
                      onTap: (int index) {
                        if (index == 0) {
                          model.changeCourseState(CourseState.myCourse);
                        } else {
                          model.changeCourseState(CourseState.overview);
                        }
                      },
                      tabs: const [
                        Tab(
                          child: Text(
                            "My Course",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Overview",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<CourseViewModel>(builder: (context, model, child) {
              if (model.courseState == CourseState.myCourse) {
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

                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: model.myCourses.length,
                    itemBuilder: (context, index) {
                      final myCourse = model.myCourses[index].course;

                      return CustomItemMyCourse(
                        myCourse: myCourse,
                      );
                    });
              }

              if (model.stateCourseOverview == ResultState.loading) {
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

              if (model.stateCourseOverview == ResultState.error) {
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

              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.courseOverview.length,
                  itemBuilder: (context, index) {
                    final courseOverview = model.courseOverview[index];

                    return CustomItemCourseOverview(courseOverview: courseOverview);
                  });
            })
          ],
        ),
      ),
    );
  }
}
