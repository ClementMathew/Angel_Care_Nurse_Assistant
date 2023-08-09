import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Nurse/assignedPatient.dart';
import 'package:nurse_assistant/Nurse/notificationsPage.dart';
import 'package:nurse_assistant/Nurse/pharmacyPage.dart';
import 'package:nurse_assistant/Nurse/profilePage.dart';
import 'package:nurse_assistant/QR_Code/ScanQRPage.dart';
import 'package:nurse_assistant/Reusables/homeList.dart';
import 'package:nurse_assistant/Reusables/popUpMenu.dart';

import '../Welcome Screens/WelcomePage.dart';

class NurseHome extends StatefulWidget {
  const NurseHome({Key? key}) : super(key: key);

  @override
  State<NurseHome> createState() => _NurseHomeState();
}

class _NurseHomeState extends State<NurseHome> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference user =
      FirebaseFirestore.instance.collection('Users');
  late DocumentReference reference = user.doc(auth.currentUser?.uid);

  String fieldData = "None";

  getName() async {
    await reference.get().then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        fieldData = snapshot.get('name') as String;
      }
    }).then((value) {
      setState(() {
      });
    });
  }

  @override
  void initState(){
    getName();
    super.initState();
  }

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
                title: StreamBuilder<DocumentSnapshot>(
                  stream: reference.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Angel Care",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ));
                    }
                    if (snapshot.hasData) {
                      DocumentSnapshot docSnapshot = snapshot.data!;
                      String fieldName = (docSnapshot.get('name')).toString();
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ));
                        },
                        child: Text(
                          fieldName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return const Text("Loading...");
                  },
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationPage()));
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 24.0,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  const PopUpMenu()
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
                          homeButton(
                              context,
                              "Scan QR Code",
                              ScanQRPage(user: fieldData),
                              'assets/icons/nurse/scanqr.png'),
                          myDivider(),
                          homeButton(
                              context,
                              "Patients Assigned",
                               AssignedPatientsPage(name: fieldData),
                              'assets/icons/nurse/patientsassigned.png'),
                          myDivider(),
                          homeButton(context, "Pharmacy", const PharmacyPage(),
                              'assets/icons/nurse/pharmacy.png'),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // const Positioned(
                //   top: 0,
                //   left: 0,
                //   right: 0,
                //   bottom: 0,
                //   child: CustomScrollView(
                //     slivers: [MyAppBar()],
                //   ),
                // ),
              ]),
            )));
  }
}