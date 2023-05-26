import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class DescriptionPage extends StatelessWidget {
  final String medicineName;
  final String medicineDescription;

  const DescriptionPage(
      {super.key,
      required this.medicineName,
      required this.medicineDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Description',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(width: width*.92,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(18)),
          margin: const EdgeInsets.all(15.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicineName,
                  style: GoogleFonts.ibarraRealNova(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 12.0),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    medicineDescription,
                    style: GoogleFonts.ibarraRealNova(fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}