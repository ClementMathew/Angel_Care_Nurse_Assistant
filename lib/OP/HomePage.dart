import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/OP/addPatient.dart';
import 'package:nurse_assistant/OP/discharge.dart';
import 'package:nurse_assistant/OP/patientEdit.dart';
import 'package:nurse_assistant/Reusables/homeList.dart';

import '../Nurse/profilePage.dart';
import '../Reusables/popUpMenu.dart';
import '../Welcome Screens/WelcomePage.dart';

class OPHome extends StatefulWidget {
  const OPHome({Key? key}) : super(key: key);

  @override
  State<OPHome> createState() => _OPHomeState();
}

class _OPHomeState extends State<OPHome> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference user =
  FirebaseFirestore.instance.collection('Users');
  late DocumentReference reference = user.doc(auth.currentUser?.uid);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: theme,
                toolbarHeight: height * .085,
                title: InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ));
                  },
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: reference.snapshots(),
                    builder:
                        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Angel Care",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ));
                      }
                      if (snapshot.hasData) {
                        DocumentSnapshot docSnapshot = snapshot.data!;
                        String fieldData = (docSnapshot.get('name')).toString();
                        return Text(
                          fieldData,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                      return const Text("Loading...");
                    },
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ));
                  },
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                actions: const [
                  PopUpMenu(),SizedBox(
                    width: 5,
                  ),
                ]),
            body: SingleChildScrollView(
              child: Stack(children: [
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
              ]),
            )));
  }
}