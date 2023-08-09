import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Nurse/SymptomsPage.dart';
import 'package:nurse_assistant/Provider/provider.dart';
import 'package:nurse_assistant/Reusables/addButton.dart';
import 'package:nurse_assistant/Reusables/buttons.dart';
import 'package:nurse_assistant/Welcome%20Screens/WelcomePage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'MedicationsPage.dart';
import 'medicalRecords.dart';

class PatientPage extends StatefulWidget {
  final name,age,date,phone,disease,imagelink,user,symptoms,medications;
  const PatientPage({Key? key, this.name, this.age, this.date, this.phone, this.disease, this.imagelink, this.user, this.symptoms, this.medications}) : super(key: key);

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {

  String status = "no";

  CollectionReference patient = FirebaseFirestore.instance.collection("Patients");
  CollectionReference alarm = FirebaseFirestore.instance.collection("Alarm");

  List<dynamic>? symptoms = [];

  getPatients() async {
    Query query = patient.where('name', isEqualTo: widget.name);

    query.snapshots().listen((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot document) {
        symptoms = document.get('symptoms') as List<dynamic>?;
      });
    });
  }

  List<dynamic>? medications = [];

  getPatientm() async {
    Query query = patient.where('name', isEqualTo: widget.name);

    query.snapshots().listen((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot document) {
        medications = document.get('medications') as List<dynamic>?;
      });
    });
  }

  Future<void> addData(String status) async {
    try {
      await alarm.doc(widget.user.toString()+widget.name.toString()).set({
        'name': widget.user,
        'patient': widget.name,
        'status': status,
      });
      print('Data added to Firestore');
    } catch (e) {
      print('Error adding data: $e');
    }
  }

  addAlarm()
  {
    status = "yes";
    addData(status);

    Future.delayed(const Duration(seconds: 5), (){
      status = "no";
      addData(status);
    });
  }

  play()
  {
    final player = AudioPlayer();
    player.play(AssetSource('audio/alarm.m4a'));
  }

  @override
  void initState() {
    getPatients();
    getPatientm();
    Future.delayed(const Duration(milliseconds: 2000),() {
      setState(() {
      });
    });
    super.initState();
  }

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
                onPressed: () {
                  addAlarm();
                  // play();
                },
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
                          ),
                        ],
                        color: Colors.white,
                        border: Border.all(width: 5, color: theme),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        )),
                    child: widget.imagelink == "unknown"? Icon(
                        Icons.person,
                        size: 100,color: theme,
                      ):
                      Image.network(widget.imagelink)
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
                              onPressed: () async {
                                final Uri url = Uri(
                                  scheme: 'tel',
                                  path: widget.phone,
                                );
                                if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                                } else {
                                print('Cannot launch this url');
                                }
                              },
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
                          trailing: MyAddButton(
                            page: SymptomsPage(name: widget.name,phone: widget.phone),
                          )),
                      ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: symptoms?.length,
                        itemBuilder: (BuildContext context, int index) {

                          String name = symptoms?[index];

                          return Padding(
                            padding: const EdgeInsets.only(left: 20,top: 5),
                            child: Text('${index+1}. $name',style: GoogleFonts.ibarraRealNova(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,),),
                          );
                        },
                      ),
                      SizedBox(height: height*.02,)
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
                          trailing: MyAddButton(
                            page: MedicationsPage(phone: widget.phone,name: widget.name),
                          )),
                      ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: medications?.length,
                        itemBuilder: (BuildContext context, int index) {

                          String name = medications?[index];

                          return Padding(
                            padding: const EdgeInsets.only(left: 20,top: 5),
                            child: Text('${index+1}. $name',style: GoogleFonts.ibarraRealNova(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,),),
                          );
                        },
                      ),
                      SizedBox(height: height*.02,)
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