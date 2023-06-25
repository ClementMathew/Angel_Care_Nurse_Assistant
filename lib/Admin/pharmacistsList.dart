import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Nurse/pharmacyPage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class PharmacistsListPage extends StatefulWidget {
  const PharmacistsListPage({Key? key}) : super(key: key);

  @override
  State<PharmacistsListPage> createState() => _PharmacistsListPageState();
}

class _PharmacistsListPageState extends State<PharmacistsListPage> {

  CollectionReference pharmacist = FirebaseFirestore.instance.collection('Pharmacists');

  changeSearch(value){
    setState(() {
    });
  }

  TextEditingController searchController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Pharmacists List',
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
              SizedBox(
                height: height * .012,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: SizedBox(
                    height: height * .06,
                    width: width * .89,
                    child: SearchBar(
                      onChanged: (value) {
                        changeSearch(value);
                      },
                      controller: searchController,
                      elevation: const MaterialStatePropertyAll(3),
                      trailing: const [
                        Padding(
                          padding: EdgeInsets.only(top: 3, right: 7),
                          child: Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                        )
                      ],
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.only(left: 15, right: 5, bottom: 2.3)),
                      hintText: "Search",
                      hintStyle: const MaterialStatePropertyAll(
                          TextStyle(color: Colors.black, fontSize: 18)),
                      textStyle: const MaterialStatePropertyAll(
                          TextStyle(color: Colors.black, fontSize: 18)),
                    )),
              ),
              SizedBox(
                height: height * .008,
              ),
              StreamBuilder(
                stream: pharmacist.snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final DocumentSnapshot testSnap =
                        snapshot.data.docs[index];
                        if (testSnap
                            .get('name')
                            .toString()
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
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
                                          "Id : ${testSnap.get('staff-id')}",
                                          style: GoogleFonts.ibarraRealNova(
                                              fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                      ),
                                      const SizedBox(height: .5),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () async {
                                        final Uri url = Uri(
                                          scheme: 'tel',
                                          path: testSnap
                                              .get('phone')
                                              .toString(),
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
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                  return Container();
                },
              ),
              SizedBox(height: height*.04,)
            ],
          ),
        ),
      ),
    );
  }
}