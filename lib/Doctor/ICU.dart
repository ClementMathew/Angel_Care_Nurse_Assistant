import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';
import 'generalWard.dart';

class ICUPage extends StatefulWidget {
  const ICUPage({Key? key}) : super(key: key);

  @override
  State<ICUPage> createState() => _ICUPageState();
}

class _ICUPageState extends State<ICUPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Intensive Care Unit',
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