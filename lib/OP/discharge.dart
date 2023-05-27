import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Nurse/pharmacyPage.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class DischargePage extends StatefulWidget {
  const DischargePage({Key? key}) : super(key: key);

  @override
  State<DischargePage> createState() => _DischargePageState();
}

class _DischargePageState extends State<DischargePage> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Discharge',
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
              patientDis(),
              patientDis(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget patientDis() {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Container(
      width: width * .9,
      height: height * .12,
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: theme),
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          )),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: .5),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text(
                  "Name : Clement Mathew",
                  style: GoogleFonts.ibarraRealNova(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text(
                  "Bed Number : 506",
                  style: GoogleFonts.ibarraRealNova(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(height: .5),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: theme,
                size: 30,
              )),
          const SizedBox(width: 5,)
        ],
      ),
    ),
  );
}