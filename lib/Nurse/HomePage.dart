import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Resusables/homeList.dart';

import '../Welcome Screens/WelcomePage.dart';

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
            appBar: AppBar(
                backgroundColor: theme,
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
                ]),
            body: Stack(children: [
              Container(
                height: height*.88,
                width: width,
                color: theme,
              ),
              SizedBox(
                height: height * .53,
                width: width,
                child: const Image(
                  image: AssetImage("assets/images/Home.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: height * .45,
                  ),
                  const HomeList(n: 3)
                ],
              ),
              // const Positioned(
              //   top: 0,
              //   left: 0,
              //   right: 0,
              //   bottom: 0,
              //   child: CustomScrollView(
              //     slivers: [MyAppBar()],
              //   ),
              // ),
            ])));
  }
}