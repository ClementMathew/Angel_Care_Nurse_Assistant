import 'package:flutter/material.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class ReportUploadPage extends StatefulWidget {
  const ReportUploadPage({Key? key}) : super(key: key);

  @override
  State<ReportUploadPage> createState() => _ReportUploadPageState();
}

class _ReportUploadPageState extends State<ReportUploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
        'Medical Report',
        style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
    ),
    ),
    centerTitle: true,
    ));
  }
}