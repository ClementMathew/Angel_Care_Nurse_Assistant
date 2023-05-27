import 'package:flutter/material.dart';
import 'package:nurse_assistant/Nurse/pharmacyPage.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';
import 'nursesList.dart';

class AttendersListPage extends StatefulWidget {
  const AttendersListPage({Key? key}) : super(key: key);

  @override
  State<AttendersListPage> createState() => _AttendersListPageState();
}

class _AttendersListPageState extends State<AttendersListPage> {

  TextEditingController searchController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Attenders List',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * .012,
              ),
              mySearch(searchController),
              SizedBox(
                height: height * .008,
              ),
              staffAdmin(),
              staffAdmin(),
            ],
          ),
        ),
      ),
    );
  }
}