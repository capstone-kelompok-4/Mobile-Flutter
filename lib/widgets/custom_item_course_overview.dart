import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../data/model/course_overview_model.dart';

class CustomItemCourseOverview extends StatelessWidget {
  const CustomItemCourseOverview({
    Key? key,
    required this.courseOverview,
  }) : super(key: key);

  final DataCourseOverView courseOverview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Image border
            child: SizedBox.fromSize(
              size: const Size(92, 112),
              child: Image.asset("assets/images/${courseOverview.image}"),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  courseOverview.name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 14, color: colorTextBlue, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox.fromSize(
                            size: const Size(20, 15),
                            child: Image.asset("assets/images/icon_book"
                                ".png")),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "${courseOverview.amountOfMaterial} Materi",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontSize: 12, color: colorTextBlue),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox.fromSize(
                            size: const Size(20, 15),
                            child: Image.asset("assets/images/icon_star.png")),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "${courseOverview.rating}",
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 12, color: colorTextBlue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Text(
                    "Read more",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 12, color: colorTextBlue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
