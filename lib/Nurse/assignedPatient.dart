import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class AssignedPatientsPage extends StatefulWidget {
  const AssignedPatientsPage({Key? key}) : super(key: key);

  @override
  State<AssignedPatientsPage> createState() => _AssignedPatientsPageState();
}

class _AssignedPatientsPageState extends State<AssignedPatientsPage> {
  String gotname = "Loading";

  CollectionReference assignedP =
      FirebaseFirestore.instance.collection('P-Assigned');
  final CollectionReference user =
      FirebaseFirestore.instance.collection('Users');
  final FirebaseAuth auth = FirebaseAuth.instance;
  late DocumentReference reference = user.doc(auth.currentUser?.uid);

  getName() {
    reference.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        gotname = documentSnapshot.get('name').toString();
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

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
                height: height * .065,
                width: width * .92,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    )),
                child: Center(
                  child: StreamBuilder(
                      stream: assignedP
                          .where('name', isEqualTo: "Clement Mathew")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          QuerySnapshot querySnapshot = snapshot.data!;

                          if (querySnapshot.docs.isNotEmpty) {
                            DocumentSnapshot documentSnapshot =
                                querySnapshot.docs.first;
                            String fieldValue =
                                documentSnapshot.get('dept') as String;
                            return Text(
                              fieldValue,
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  color: theme),
                            );
                          } else {
                            return const Text('No matching documents found');
                          }
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                ),
              ),
            ),
          ),
          patient(),
          patient(),
        ],
      ),
    );
  }
}

Widget patient() {
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
      child: Column(
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
    ),
  );
}