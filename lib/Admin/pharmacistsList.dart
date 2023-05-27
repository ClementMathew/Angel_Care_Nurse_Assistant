import 'package:flutter/material.dart';
import 'package:nurse_assistant/Nurse/pharmacyPage.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';
import 'nursesList.dart';

class PharmacistsListPage extends StatefulWidget {
  const PharmacistsListPage({Key? key}) : super(key: key);

  @override
  State<PharmacistsListPage> createState() => _PharmacistsListPageState();
}

class _PharmacistsListPageState extends State<PharmacistsListPage> {

  TextEditingController searchController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Pharmacists List',
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