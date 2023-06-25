import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Admin/patientToNurse.dart';
import 'package:nurse_assistant/Reusables/buttons.dart';
import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class PatientSelectionPage extends StatefulWidget {
  final dept;
  const PatientSelectionPage({Key? key, this.dept}) : super(key: key);

  @override
  State<PatientSelectionPage> createState() => _PatientSelectionPageState();
}

class _PatientSelectionPageState extends State<PatientSelectionPage> {

  CollectionReference patient = FirebaseFirestore.instance.collection('Patients');

  @override
  void initState(){
    getSize();
    super.initState();
  }

  List<bool?> selectedCheckboxes = [];
  List<String> selectedPatient = [];

  getSize() async {
    QuerySnapshot snapshot = await patient.get();
    selectedCheckboxes = List.generate(snapshot.size, (index) => false) ;
    selectedPatient = List.generate(snapshot.size, (index) => "not");
  }

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
          'General Ward',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: height * .018,
            backgroundColor: Colors.white,
            child: Text(
              "2",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: theme),
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: Stack(
        children: [Container(
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
                  future: patient.get(),
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
                            return  Padding(
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
                                            "Name : ${testSnap.get('name')}",
                                            style: GoogleFonts.ibarraRealNova(
                                                fontWeight: FontWeight.bold, fontSize: 20),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 22),
                                          child: Text(
                                            "Bed Number : ${testSnap.get('bed')}",
                                            style: GoogleFonts.ibarraRealNova(
                                                fontWeight: FontWeight.bold, fontSize: 20),
                                          ),
                                        ),
                                        const SizedBox(height: .5),
                                      ],
                                    ),
                                    const Spacer(),
                                    Transform.scale(
                                      scale: 1.5,
                                      child: Checkbox(
                                        side: MaterialStateBorderSide.resolveWith(
                                                (states) => BorderSide(color: theme, width: 2)),
                                        checkColor: Colors.white,
                                        activeColor: theme,
                                        value: selectedCheckboxes[index],
                                        shape: const CircleBorder(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedCheckboxes[index] = value;
                                          });
                                          if(value == true){
                                            selectedPatient[index] = testSnap.get('name');
                                          }
                                          else{
                                            selectedPatient[index] = "not";
                                          }
                                        },
                                      ),
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
                  height: height*.11,
                ),
              ],
            ),
          ),
        ),Positioned(
          top: height*.79,
          left: 20,
          right: 20,
          child: longButton("Add to Nurse", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientToNursePage(selectedPatient: selectedPatient,dept: widget.dept),
                ));
          }),
        )]
      ),
    );
  }
}