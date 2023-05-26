import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class AssignedPatientsPage extends StatelessWidget {
  const AssignedPatientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Patients Assigned',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: height*.065,
                width: width*.92,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(18),)
                ),
                child: Center(
                  child: Text("General Ward",style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: theme
                  ),
                  ),
                ),
              ),
            ),
          ),
          patientAssg(),
          patientAssg(),
        ],
      ),
    );
  }
}

Widget patientAssg(){
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Container(
      width: width*.9,
      height: height*.14,
      decoration: BoxDecoration(
          border: Border.all(width: 3,color: theme),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(18),
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: .5),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text("Name : Clement Mathew",style: GoogleFonts.ibarraRealNova( fontWeight: FontWeight.bold,fontSize: 23),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text("Bed Number : 506",style: GoogleFonts.ibarraRealNova( fontWeight: FontWeight.bold,fontSize: 23),),
          ),
          const SizedBox(height: .5),
        ],
      ),
    ),
  );
}