import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class AssignedPatientsPage extends StatefulWidget {
  final name;

  const AssignedPatientsPage({Key? key, this.name}) : super(key: key);

  @override
  State<AssignedPatientsPage> createState() => _AssignedPatientsPageState();
}

class _AssignedPatientsPageState extends State<AssignedPatientsPage> {
  CollectionReference assignedP =
      FirebaseFirestore.instance.collection('P-Assigned');

  List<dynamic>? array = [];

  getPatients() async {
    Query query = assignedP.where('name', isEqualTo: widget.name);

    query.snapshots().listen((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot document) {
        array = document.get('patients') as List<dynamic>?;
      });
    });
  }

  @override
  void initState() {
    getPatients();
    Future.delayed(const Duration(milliseconds: 400),() {
      setState(() {
      });
    });
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
      body: SingleChildScrollView(
        child: Column(
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
                            .where('name', isEqualTo: widget.name)
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
                              return Text(
                                'No Duty',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: theme),
                              );
                            }
                          } else if (snapshot.hasError) {
                            return Text(
                              'Loading',
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  color: theme),
                            );
                          } else {
                            return const Text('');
                          }
                        }),
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: array?.length,
              itemBuilder: (BuildContext context, int index) {

                String name = array?[index];
                List assigned = name.split("-");

                return Padding(
                  padding: const EdgeInsets.only(top: 15,right: 18,left: 18),
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
                            "Name : ${assigned[0]}",
                            style: GoogleFonts.ibarraRealNova(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Text(
                            "Bed Number : ${assigned[1]}",
                            style: GoogleFonts.ibarraRealNova(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: .5),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height*.025,)
          ],
        ),
      ),
    );
  }
}