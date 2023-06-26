import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';
import 'generalWard.dart';

class OTPage extends StatefulWidget {
  const OTPage({Key? key}) : super(key: key);

  @override
  State<OTPage> createState() => _OTPageState();
}

class _OTPageState extends State<OTPage> {

  CollectionReference assignedP = FirebaseFirestore.instance.collection('P-Assigned');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Operation Theatre',
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
              StreamBuilder(
                stream: assignedP.where('dept',isEqualTo: "Operation Theatre").snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final DocumentSnapshot testSnap =
                        snapshot.data.docs[index];

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
                                        "${testSnap.get('name')}",
                                        style: GoogleFonts.ibarraRealNova(
                                            fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 22),
                                      child: Text(
                                        "Id : ${testSnap.get('id')}",
                                        style: GoogleFonts.ibarraRealNova(
                                            fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(height: .5),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {

                                    },
                                    icon: Icon(
                                      Icons.notifications_active_sharp,
                                      color: theme,
                                      size: 30,
                                    )),
                                IconButton(
                                    onPressed: () async {
                                      final Uri url = Uri(
                                        scheme: 'tel',
                                        path: testSnap.get('phone'),
                                      );
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      } else {
                                        print('Cannot launch this url');
                                      }
                                    },
                                    icon: Icon(
                                      Icons.phone,
                                      color: theme,
                                      size: 30,
                                    )),
                                const SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
              SizedBox(height: height*.02,)
            ],
          ),
        ),
      ),);
  }
}