import 'package:flutter/material.dart';
import 'package:lms/widgets/custom_item_thread_forum.dart';

import '../../constants/styles.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({Key? key}) : super(key: key);

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final TextEditingController _threadController = TextEditingController();

  void _searchThread() {}

  @override
  void dispose() {
    _threadController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlueDark,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 3.0,
        shadowColor: Colors.black,
        title: Text(
          "Forum Alterra",
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: colorTextBlue,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
            child: TextFormField(
              controller: _threadController,
              autocorrect: false,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _searchThread(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                fillColor: Colors.white,
                filled: true,
                hintText: "Tulis thread mu disini...",
                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: colorTextBlue,
                      fontWeight: FontWeight.bold,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: colorBlueDark, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: colorBlueDark, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return const CustomItemThreadForum();
          }),
    );
  }
}
