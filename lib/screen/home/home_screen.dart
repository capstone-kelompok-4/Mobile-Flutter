import 'package:flutter/material.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/screen/home/home_view_model.dart';
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
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final HomeViewModel homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

      homeViewModel.getMyCourseFromJson();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: colorBlack,
        elevation: 1.0,
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
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 280,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: colorBlueDark, borderRadius: BorderRadius.circular(25.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 0,
                          child: Text(
                            "WELCOME ARYA!",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          flex: 0,
                          child: Text(
                            "Satisfy your curiosity with thousands of amazing courses. Upgrade your skills, deepen existing",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              final MainViewModel mainViewModel =
                                  Provider.of<MainViewModel>(context, listen: false);

                              mainViewModel.setIndexBottomNav(1);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: grey200,
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                            ),
                            child: Text(
                              "Get Started",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/people_opening_laptop.png",
                      scale: 0.7,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: colorBlueDark,
                  ),
                  prefixStyle:
                      Theme.of(context).textTheme.subtitle2!.copyWith(color: colorBlueDark),
                  hintText: 'Mau belajar apa hari ini?',
                  hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: colorBlueDark),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorBlueDark),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Webinar Training",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
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
                      return const SizedBox();
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CustomItemWebinar();
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Course History",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer<HomeViewModel>(builder: (context, model, child) {
                if (model.stateMyCourses == ResultState.loading) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: CircularProgressIndicator(),
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
                  height: 185,
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
                        final myCourse = model.myCourses[index];
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
