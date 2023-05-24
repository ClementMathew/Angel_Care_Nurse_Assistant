import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Resusables/homeList.dart';

import '../Welcome Screens/WelcomePage.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
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
            body: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  height: height * 1.13,
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
                    Container(
                      height: height * .125 * 5,
                      width: width,
                      decoration: BoxDecoration(
                          color: secondary,
                          border: Border.all(width: 2, color: theme),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(22),
                          ),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 1))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          homeButton(context, "Scan QR Code", null,
                            'assets/icons/doctor/scanqr.png'),
                          myDivider(),
                          homeButton(context, "General Ward", null,
                              'assets/icons/doctor/generalward.png'),
                          myDivider(),
                          homeButton(context, "Intensive Care Unit", null,
                              'assets/icons/doctor/icu.png'),
                          myDivider(),
                          homeButton(context, "Casuality", null,
                              'assets/icons/doctor/casuality.png'),
                          myDivider(),
                          homeButton(context, "Operation Theatre", null,
                              'assets/icons/doctor/ot.png'),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            )));
  }
}