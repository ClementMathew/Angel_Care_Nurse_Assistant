import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Doctor/Casuality.dart';
import 'package:nurse_assistant/Doctor/OT.dart';
import 'package:nurse_assistant/Doctor/generalWard.dart';
import 'package:nurse_assistant/Nurse/PatientPage.dart';
import 'package:nurse_assistant/QR_Code/ScanQRPage.dart';
import 'package:nurse_assistant/Reusables/homeList.dart';

import '../Nurse/notificationsPage.dart';
import '../Nurse/profilePage.dart';
import '../Reusables/popUpMenu.dart';
import '../Welcome Screens/WelcomePage.dart';
import 'ICU.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference user =
      FirebaseFirestore.instance.collection('Users');
  late DocumentReference reference = user.doc(auth.currentUser?.uid);

  CollectionReference alarm = FirebaseFirestore.instance.collection("Alarm");

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
                      String fieldData = (docSnapshot.get('name')).toString();
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ));
                        },
                        child: Text(
                          fieldData,
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
                  StreamBuilder<QuerySnapshot>(
                    stream: alarm.snapshots(),
                    // Stream of snapshots from the "users" collection
                    builder: (context, snapshot) {
                      DocumentSnapshot document = snapshot.data!.docs[0];
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      if(data['status'] == "yes"){
                        final player = AudioPlayer();
                        player.play(AssetSource('audio/alarm.m4a'));
                        return Icon(Icons.notifications_active);
                      }
                      return IconButton(
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
                          ));
                    },
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  const PopUpMenu(),

                ]),
            body: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  height: height * 1.04,
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
                      height: height * .11 * 5,
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
                            height: 10,
                          ),
                          homeButton(
                              context,
                              "Scan QR Code",
                              const ScanQRPage(),
                              'assets/icons/doctor/scanqr.png'),
                          myDivider(),
                          homeButton(
                              context,
                              "General Ward",
                              const GeneralWardPage(),
                              'assets/icons/doctor/generalward.png'),
                          myDivider(),
                          homeButton(context, "Intensive Care Unit",
                              const ICUPage(), 'assets/icons/doctor/icu.png'),
                          myDivider(),
                          homeButton(
                              context,
                              "Casuality",
                              const CasualityPage(),
                              'assets/icons/doctor/casuality.png'),
                          myDivider(),
                          homeButton(context, "Operation Theatre",
                              const OTPage(), 'assets/icons/doctor/ot.png'),
                          const SizedBox(
                            height: 10,
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