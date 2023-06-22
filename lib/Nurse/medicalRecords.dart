import 'package:flutter/material.dart';
import 'package:nurse_assistant/Reusables/medicalRecordButtons.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class MedicalRecordsPage extends StatefulWidget {
  const MedicalRecordsPage({Key? key}) : super(key: key);

  @override
  State<MedicalRecordsPage> createState() => _MedicalRecordsPageState();
}

class _MedicalRecordsPageState extends State<MedicalRecordsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: secondary,
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: height * .085,
              backgroundColor: theme,
              title: const Text(
                "Medical Records",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [const SizedBox(height: 10,),
                    MRButton("MRI Scan Report"),
                    MRButton("Blood Test Report"),
                    MRButton("CT Scan Report"),
                    MRButton("X-Ray Report"),
                  ],
                ),
              ),
            )));
  }
}