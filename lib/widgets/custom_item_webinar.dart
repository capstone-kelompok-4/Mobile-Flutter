import 'package:flutter/material.dart';

class CustomItemWebinar extends StatelessWidget {
  const CustomItemWebinar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        "assets/images/webinar_1.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
