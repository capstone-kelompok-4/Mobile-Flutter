import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/screen/course/course_screen.dart';
import 'package:lms/screen/forum/forum_screen.dart';
import 'package:lms/screen/main/main_view_model.dart';
import 'package:lms/screen/profile/profile_screen.dart';
import 'package:provider/provider.dart';

import '../home/home_screen.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main_screen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final autoSizeGroup = AutoSizeGroup();

  final List<String> _listIconMenu = [
    "assets/images/icon_menu_home.png",
    "assets/images/icon_menu_course.png",
    "assets/images/icon_menu_forum.png",
    "assets/images/icon_menu_profile.png"
  ];

  final List<Widget> _listWidgetMenu = [
    const HomeScreen(),
    const CourseScreen(),
    const ForumScreen(),
    const ProfileScreen()
  ];

  final List<String> _listMenu = ["Home", "Course", "Forum", "Profile"];

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(milliseconds: 500),
      () => _animationController.forward(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(builder: (context, model, child) {
      return Scaffold(
        body: _listWidgetMenu[model.indexBottomNav],
        backgroundColor: Colors.white,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          backgroundColor: Colors.white,
          itemCount: _listMenu.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? colorOrange : inactiveMenu;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _listIconMenu[index],
                  height: 24,
                  color: color,
                ),
                if (model.indexBottomNav == index)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: AutoSizeText(
                      _listMenu[index],
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: color, fontSize: 12.0),
                      group: autoSizeGroup,
                    ),
                  ),
              ],
            );
          },
          elevation: 3.0,
          gapLocation: GapLocation.none,
          splashColor: colorOrange,
          notchAndCornersAnimation: animation,
          notchSmoothness: NotchSmoothness.defaultEdge,
          splashSpeedInMilliseconds: 400,
          leftCornerRadius: 10,
          rightCornerRadius: 10,
          activeIndex: model.indexBottomNav,
          onTap: (index) => model.setIndexBottomNav(index),
        ),
      );
    });
  }
}
