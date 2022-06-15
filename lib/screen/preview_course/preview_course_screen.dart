import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/data/model/my_course_model.dart';

import '../../widgets/custom_item_section.dart';

class PreviewCourseScreen extends StatefulWidget {
  static const String routeName = 'preview_course_screen';
  final DataMyCourse myCourse;
  const PreviewCourseScreen({Key? key, required this.myCourse}) : super(key: key);

  @override
  State<PreviewCourseScreen> createState() => _PreviewCourseScreenState();
}

class _PreviewCourseScreenState extends State<PreviewCourseScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          automaticallyImplyLeading: true,
          floating: true,
          pinned: true,
          snap: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
              child: Text(
                widget.myCourse.name,
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
            decoration:
                BoxDecoration(color: colorBlueDark, borderRadius: BorderRadius.circular(50.0)),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 26.0, top: 26.0, right: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.myCourse.name,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: colorTextBlue,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox.fromSize(
                              size: const Size(20, 15),
                              child: Image.asset("assets/images/icon_book"
                                  ".png")),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "9 Materi",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontSize: 12, color: colorTextBlue),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox.fromSize(
                              size: const Size(20, 15),
                              child: Image.asset("assets/images/icon_star.png")),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "${widget.myCourse.rating}",
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                fontSize: 12, color: colorTextBlue, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: colorOrange,
                            shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                        child: Text(
                          "Course",
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: widget.myCourse.description,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 12, color: colorTextBlue),
                      children: [
                        TextSpan(
                            text: ' Read more',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontSize: 12, color: colorOrange),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mentor",
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: colorTextBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: ClipOval(
                                  child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_RlT-ytB9A_TQFLKMqVYpdJiiRbckTCThmw&usqp=CAU"),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "Ilham Akbar",
                                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: colorTextBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Progress",
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: colorTextBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    backgroundColor: colorBlueDark,
                                    color: colorOrange,
                                    value: widget.myCourse.progress / 100),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "${widget.myCourse.progress}%",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: colorTextBlue, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    "Course List",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: colorTextBlue,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8.0,
                );
              },
              itemCount: widget.myCourse.materials.length,
              itemBuilder: (context, index) {
                final section = widget.myCourse.materials[index];
                return CustomItemSection(
                  section: section,
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
