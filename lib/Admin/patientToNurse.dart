import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Reusables/buttons.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

String? nurse;
String? name;
String? phone;

class PatientToNursePage extends StatefulWidget {
  final List selectedPatient;
  final dept;
  const PatientToNursePage({Key? key, this.dept, required this.selectedPatient})
      : super(key: key);

  @override
  State<PatientToNursePage> createState() => _PatientToNursePageState();
}

class _PatientToNursePageState extends State<PatientToNursePage> {
  CollectionReference assignedP = FirebaseFirestore.instance.collection('P-Assigned');
  CollectionReference user = FirebaseFirestore.instance.collection('Users');

  changeSearch(value) {
    setState(() {});
  }

  List selectedNurses= [];

  find(){
    for (var i = 0; i <= widget.selectedPatient.length-1; i++) {
      if(widget.selectedPatient[i] != "not"){
        selectedNurses.add(widget.selectedPatient[i]);
      }
    }
  }

  @override
  void initState(){
    find();
    super.initState();
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
          'Nurses List',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
          height: height,
          width: width,
          color: Colors.transparent,
          child: SingleChildScrollView(
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
                FutureBuilder(
                  future: user.where('working-as', isEqualTo: 'Nurse').get(),
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
                              padding: const EdgeInsets.only(
                                  top: 15, right: 18, left: 18),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: .5),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 22),
                                          child: Text(
                                            "${testSnap.get('name')}",
                                            style: GoogleFonts.ibarraRealNova(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 22),
                                          child: Text(
                                            "Id : ${testSnap.get('staff-id')}",
                                            style: GoogleFonts.ibarraRealNova(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        const SizedBox(height: .5),
                                      ],
                                    ),
                                    const Spacer(),
                                    Transform.scale(
                                      scale: 1.5,
                                      child: Radio(
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.selected)) {
                                                return theme;
                                              }
                                              return theme;
                                            },
                                          ),
                                          value: testSnap.get('staff-id'),
                                          groupValue: nurse,
                                          onChanged: (value) {
                                            setState(() {
                                              nurse = value;
                                            });
                                          }),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
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
                SizedBox(
                  height: height * .11,
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: height * .79,
            right: 20,
            left: 20,
            child: longButton("Assign", () async {
              QuerySnapshot snapshot = await user
                  .where('staff-id',
                  isEqualTo: nurse)
                  .get();
              snapshot.docs.forEach((element) {
                name = element['name'];
                phone = element['phone'].toString();
              });

              assignedP.add({
                'id':nurse,
                'dept':widget.dept,
                'name':name,
                'phone':phone,
                'patients':selectedNurses
              });
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            }))
      ]),
    );
  }
}