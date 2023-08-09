import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  CollectionReference sassign =
      FirebaseFirestore.instance.collection("S-Assigned");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        appBar: AppBar(
          toolbarHeight: height * .085,
          backgroundColor: theme,
          title: const Text(
            'Notifications',
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
            notify(),
            StreamBuilder<QuerySnapshot>(
              stream: sassign.snapshots(),
              // Stream of snapshots from the "users" collection
              builder: (context, snapshot) {

                if (snapshot.hasError) {
                  return Container();
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(color: theme,);
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = snapshot.data!.docs[index];
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    return Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      padding: const EdgeInsets.all(18),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              // shadow color
                              spreadRadius: 2,
                              // how spread the shadow should be
                              blurRadius: 3,
                              // how blurred the shadow should be
                              offset:
                                  const Offset(0, 0), // offset of the shadow
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data['date']} - ${data['time']}",
                            style: TextStyle(
                                color: theme,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: .5),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "22-05-2023 , 12:30 pm",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Your shift is assigned.",
                            style: GoogleFonts.ibarraRealNova(fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        )));
  }
}

Widget notify() {
  return Container(
    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
    padding: const EdgeInsets.all(18),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // shadow color
            spreadRadius: 2, // how spread the shadow should be
            blurRadius: 3, // how blurred the shadow should be
            offset: const Offset(0, 0), // offset of the shadow
          ),
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Clement Mathew - 506",
          style: TextStyle(
              color: theme,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: .5),
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          "22-05-2023 , 12:30 pm",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Time to give medication.",
          style: GoogleFonts.ibarraRealNova(fontSize: 20),
        ),
      ],
    ),
  );
}