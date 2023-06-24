import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Reusables/arrowButton.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';
import 'descPage.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({Key? key}) : super(key: key);

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {

  CollectionReference pharmacy = FirebaseFirestore.instance.collection('Pharmacy');

  changeSearch(value){
    setState(() {
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Pharmacy',
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
                stream: pharmacy.snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
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
                            padding: const EdgeInsets.only(top: 10,right: 19,left: 19),
                            child: Container(
                              height: height * .12,
                              width: width * .9,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(0, 3))
                                  ],
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(18)),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 1),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 25),
                                        child: Text(
                                          "Name : ${testSnap.get('name')}",
                                          style: GoogleFonts.ibarraRealNova(
                                              fontWeight: FontWeight.bold, fontSize: 21),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 25),
                                        child: Text(
                                          "Quantity : ${testSnap.get('quantity')}",
                                          style: GoogleFonts.ibarraRealNova(
                                              fontWeight: FontWeight.bold, fontSize: 21),
                                        ),
                                      ),
                                      const SizedBox(height: 1),
                                    ],
                                  ),
                                  const Spacer(),
                                  MyArrowButton(
                                      context,
                                      DescriptionPage(
                                        medicineName: "${testSnap.get('name')}",
                                        medicineDescription:
                                        "${testSnap.get('description')}",
                                      )),
                                  SizedBox(
                                    width: width * .04,
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
            ],
          ),
        ),
      ),
    );
  }
}