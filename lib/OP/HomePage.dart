import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/OP/addPatient.dart';
import 'package:nurse_assistant/OP/discharge.dart';
import 'package:nurse_assistant/OP/patientEdit.dart';
import 'package:nurse_assistant/Resusables/homeList.dart';

import '../Welcome Screens/WelcomePage.dart';

class OPHome extends StatefulWidget {
  const OPHome({Key? key}) : super(key: key);

  @override
  State<OPHome> createState() => _OPHomeState();
}

class _OPHomeState extends State<OPHome> {
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
                      Icons.more_vert,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),const SizedBox(
                    width: 5,
                  ),
                ]),
            body: Stack(children: [
              Container(
                height: height * .88,
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
                    height: height * .125 * 3,
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
                        homeButton(context, "Add Patient", const AddPatientPage(),
                            'assets/icons/op/addpatient.png'),
                        myDivider(),
                        homeButton(context, "Update Patient", const PatientEditPage(),
                            'assets/icons/op/patientslist.png'),
                        myDivider(),
                        homeButton(context, "Discharge", const DischargePage(),
                            'assets/icons/op/discharge.png'),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ])));
  }
}