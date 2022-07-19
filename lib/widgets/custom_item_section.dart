import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lms/data/model/course_detail/course_detail_model.dart';
import 'package:lms/screen/section_quiz/section_quiz_screen.dart';
import 'package:lms/screen/section_video/section_video_screen.dart';

import '../constants/styles.dart';
import '../screen/section_material/section_material_screen.dart';

class CustomItemSection extends StatefulWidget {
  final CourseDetailDataSection section;
  const CustomItemSection({Key? key, required this.section}) : super(key: key);

  @override
  State<CustomItemSection> createState() => _CustomItemSectionState();
}

class _CustomItemSectionState extends State<CustomItemSection> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void _setRotation(int degrees) {
    final angle = degrees * pi / 180;

    _animation = Tween<double>(begin: 0, end: angle).animate(_animationController);
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _setRotation(180);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: colorBlueDark,
      collapsedBackgroundColor: colorBlueDark,
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      onExpansionChanged: (state) {
        if (state) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      },
      childrenPadding: const EdgeInsets.only(right: 16.0, bottom: 16.0, left: 16.0),
      title: Text(
        "Section ${widget.section.number}",
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Colors.white,
            ),
      ),
      subtitle: Text(
        widget.section.name,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
      trailing: AnimatedBuilder(
        animation: _animation,
        child: Image.asset("assets/images/icon_arrow_down.png"),
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value,
            child: child,
          );
        },
      ),
      children: widget.section.materials
          .map(
            (item) => InkWell(
              onTap: () {
                if (item.type == "SLIDE") {
                  Navigator.pushNamed(context, SectionMaterialScreen.routeName,
                      arguments: widget.section);
                }
                if (item.type == "VIDEO") {
                  Navigator.pushNamed(context, SectionVideoScreen.routeName,
                      arguments: widget.section);
                }
                if (item.type == "QUIZ") {
                  Navigator.pushNamed(context, SectionQuizScreen.routeName,
                      arguments: widget.section);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (item.type == "QUIZ")
                      const SizedBox(
                        width: 2.0,
                      ),
                    item.type == "SLIDE"
                        ? Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.only(left: 2),
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: colorOrange,
                              borderRadius: BorderRadius.circular(150.0),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.download_rounded,
                                size: 15,
                                color: colorBlueDark,
                              ),
                            ),
                          )
                        : item.type == "VIDEO"
                            ? const Icon(
                                Icons.play_circle_fill,
                                color: colorOrange,
                              )
                            : item.type == "QUIZ"
                                ? SizedBox.fromSize(
                                    size: const Size(20, 20),
                                    child: Center(
                                      child: Image.asset("assets/images/icon_flash.png"),
                                    ),
                                  )
                                : Container(
                                    width: 20,
                                    height: 20,
                                    margin: const EdgeInsets.only(left: 2),
                                    padding: const EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                      color: colorOrange,
                                      borderRadius: BorderRadius.circular(150.0),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 15,
                                        color: colorBlueDark,
                                      ),
                                    ),
                                  ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Text(
                        "${item.type} - ${widget.section.name}",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
