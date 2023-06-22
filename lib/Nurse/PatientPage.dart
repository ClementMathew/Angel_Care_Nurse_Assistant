import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Nurse/SymptomsPage.dart';
import 'package:nurse_assistant/Reusables/addButton.dart';
import 'package:nurse_assistant/Reusables/buttons.dart';
import 'package:nurse_assistant/Welcome%20Screens/WelcomePage.dart';

import 'MedicationsPage.dart';
import 'medicalRecords.dart';

class PatientPage extends StatefulWidget {
  final name,age,date,phone,disease;
  const PatientPage({Key? key, this.name, this.age, this.date, this.phone, this.disease}) : super(key: key);

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
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
            "Patient Record",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_active_sharp,
                  size: 26,
                )),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        body: Stack(
          children: [ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: height * .22,
                    width: height * .22,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ],
                        color: Colors.white,
                        border: Border.all(width: 5, color: theme),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        )),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person,
                        size: 80,
                      ),
                      color: theme,
                    ),
                    // child: Image.asset(
                    //     ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * .365,
                        height: height * .13,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(widget.name,
                              style: GoogleFonts.roboto(
                                height: 1.3,
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Chip(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        label: Text(
                          "Age : ${widget.age}",
                          style: GoogleFonts.ibarraRealNova(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        elevation: 3,
                        padding: const EdgeInsets.all(8),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 13, top: 15),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Row(
                          children: [
                            Text(
                              "Admitted date  : ",
                              style: GoogleFonts.ibarraRealNova(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                            Text(
                              " ${widget.date}",
                              style: GoogleFonts.ibarraRealNova(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  letterSpacing: .5),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Phone  : ",
                              style: GoogleFonts.ibarraRealNova(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                          ),
                          Text(
                            " ${widget.phone}",
                            style: GoogleFonts.ibarraRealNova(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: .5),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.phone,
                                size: 29,
                              ),
                              color: theme,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 15),
                        child: Row(
                          children: [
                            Text(
                              "Disease  : ",
                              style: GoogleFonts.ibarraRealNova(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                            Text(
                              " ${widget.disease}",
                              style: GoogleFonts.ibarraRealNova(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 13, top: 5),
                child: Card(
                  elevation: 3,
                  color: background,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ListTile(
                          title: Text(
                            "Symptoms",
                            style: GoogleFonts.ibarraRealNova(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                decoration: TextDecoration.underline),
                          ),
                          trailing: const MyAddButton(
                            page: SymptomsPage(),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 13, top: 5),
                child: Card(
                  elevation: 3,
                  color: background,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ListTile(
                          title: Text(
                            "Medications",
                            style: GoogleFonts.ibarraRealNova(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                decoration: TextDecoration.underline),
                          ),
                          trailing: const MyAddButton(
                            page: MedicationsPage(),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: height*.11),
            ],
          ),Positioned(
            bottom: 1,
            left: 20,
            right: 20,
            child: longButton("Previous Medical Records", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MedicalRecordsPage(),
                  ));
            }),
          )]
        ),
      ),
    );
  }
}