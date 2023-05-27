import 'package:flutter/material.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';
import 'generalWard.dart';

class CasualityPage extends StatefulWidget {
  const CasualityPage({Key? key}) : super(key: key);

  @override
  State<CasualityPage> createState() => _CasualityPageState();
}

class _CasualityPageState extends State<CasualityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Casuality',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            staffDoc(),
            staffDoc(),
          ],
        ),
      ),);
  }
}