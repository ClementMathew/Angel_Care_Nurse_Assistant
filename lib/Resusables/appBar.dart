import 'package:flutter/material.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: theme,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      toolbarHeight: height * .085,
      title: const Text(
        'Name',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.account_circle_rounded,
          color: Colors.white,
          size: 28,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 24.0,
            )),
        const SizedBox(
          width: 1,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 26,
          ),
        )
      ],
    );
  }
}