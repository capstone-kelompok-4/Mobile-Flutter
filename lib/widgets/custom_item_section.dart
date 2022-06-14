import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/styles.dart';

class CustomItemSection extends StatefulWidget {
  final int index;
  const CustomItemSection({Key? key, required this.index}) : super(key: key);

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
        "Section ${widget.index + 1}",
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Colors.white,
            ),
      ),
      subtitle: Text(
        "Fundamental of UI/UX",
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
      children: [
        GestureDetector(
          child: Row(
            children: [
              const Icon(
                Icons.play_circle_fill,
                color: colorOrange,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                "Play Video",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        GestureDetector(
          child: Row(
            children: [
              Container(
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
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                "Unduh Materi",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        GestureDetector(
          child: Row(
            children: [
              const SizedBox(
                width: 2.0,
              ),
              SizedBox.fromSize(
                size: const Size(20, 20),
                child: Center(
                  child: Image.asset("assets/images/icon_flash.png"),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                "Quiz",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
