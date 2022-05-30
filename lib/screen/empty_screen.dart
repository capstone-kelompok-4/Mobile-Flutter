import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  static const String routeName = '/empty_screen';

  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Halaman tidak ditemukan",
        ),
      ),
    );
  }
}
