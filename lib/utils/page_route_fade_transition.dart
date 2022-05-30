import 'package:flutter/material.dart';

class PageRouteFadeTransition extends PageRouteBuilder {
  PageRouteFadeTransition(Widget screen)
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => screen,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: 0.0, end: 1.0);
              return FadeTransition(
                opacity: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 500));
}
