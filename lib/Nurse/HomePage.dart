import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Resusables/homeList.dart';

import '../Resusables/appBar.dart';
import '../Welcome Screens/WelcomePage.dart';
import 'ScanQRPage.dart';

class NurseHome extends StatefulWidget {
  const NurseHome({Key? key}) : super(key: key);

  @override
  State<NurseHome> createState() => _NurseHomeState();
}

class _NurseHomeState extends State<NurseHome> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        height: height,
        color: theme,
      ),
      Column(
        children: [
          SizedBox(
            height: height * .06,
          ),
          SizedBox(
            height: height * .5,
            width: width,
            child: const Image(
              image: AssetImage("assets/images/Home.png"),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      Column(
        children: [
          SizedBox(
            height: height * .54  ,
          ),
          const HomeList(n: 3)
        ],
      ),
      const CustomScrollView(
        slivers: [MyAppBar()],
      ),
    ])));
  }
}