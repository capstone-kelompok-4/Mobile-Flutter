import 'package:flutter/material.dart';

import '../constants/styles.dart';

class CustomItemThreadForum extends StatefulWidget {
  const CustomItemThreadForum({Key? key}) : super(key: key);

  @override
  State<CustomItemThreadForum> createState() => _CustomItemThreadForumState();
}

class _CustomItemThreadForumState extends State<CustomItemThreadForum> {
  final TextEditingController _commentController = TextEditingController();

  void _addComment() {}

  @override
  void dispose() {
    _commentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/avatar_example_1.png",
                    scale: .7,
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dave Christian",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: colorTextBlue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        "6h ago",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: colorTextBlue,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Hi mates!\nSo I talked with mentor and because we are approaching the "
              "end of the mini project, we have to collect certificates that have completed all courses to be evaluated and sent to the campus.",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: colorTextBlue,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "12 Comments",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: colorGrey,
                        ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: colorGrey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/icon_comment.png",
                          color: colorTextBlue,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Comment",
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: colorTextBlue,
                              ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: colorGrey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: TextFormField(
              controller: _commentController,
              autocorrect: false,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _addComment(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                fillColor: colorBgCourse,
                filled: true,
                hintText: "Tulis komentar disini...",
                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: colorTextBlue,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
