import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Resusables/homeList.dart';

import '../Welcome Screens/WelcomePage.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
                  height: height * 1.622,
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
                      height: height * .125 * 9,
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
                          homeButton(
                              context, "Create QR Code", null, 'assets/icons/admin/createqr.png'),
                          myDivider(),
                          homeButton(context, "Report Upload", null,
                              'assets/icons/admin/reportupload.png'),
                          myDivider(),
                          homeButton(context, "Shift Assignment", null,
                              'assets/icons/admin/shiftassignment.png'),
                          myDivider(),
                          homeButton(context, "Patient Assignment", null,
                              'assets/icons/admin/patientassignment.png'),
                          myDivider(),
                          homeButton(context, "Nurses List", null,
                              'assets/icons/admin/nurseslist.png'),
                          myDivider(),
                          homeButton(context, "Patients List", null,
                              'assets/icons/admin/patientslist.png'),
                          myDivider(),
                          homeButton(context, "Doctors List", null,
                              'assets/icons/admin/doctorslist.png'),
                          myDivider(),
                          homeButton(context, "Pharmacists List", null,
                              'assets/icons/admin/pharmacistslist.png'),
                          myDivider(),
                          homeButton(context, "Attenders List", null,
                              'assets/icons/admin/attenderslist.png'),
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