import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Reusables/buttons.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class ShiftTimePage extends StatefulWidget {
  final time;
  final date;
  const ShiftTimePage({Key? key, this.time, this.date}) : super(key: key);

  @override
  State<ShiftTimePage> createState() => _ShiftTimePageState();
}

class _ShiftTimePageState extends State<ShiftTimePage> {

  CollectionReference user = FirebaseFirestore.instance.collection("Users");
  CollectionReference shift = FirebaseFirestore.instance.collection("S-Assigned");

  changeSearch(value) {
    setState(() {});
  }

  List<bool?> selectedCheckboxes = [];
  List<String> selectedNurses = [];

  List selected= [];

  getSize() async {
    QuerySnapshot snapshot = await user.where('working-as', isEqualTo: "Nurse").get();
    selectedCheckboxes = List.generate(snapshot.size, (index) => false) ;
    selectedNurses = List.generate(snapshot.size, (index) => "not");
  }

  @override
  void initState(){
    getSize();
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
        title: Text(
          widget.time,
          style: const TextStyle(
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
      body: Center(
        child: Column(
          children: [
            Expanded(
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
                    FutureBuilder<QuerySnapshot>(
                      future: user.where('working-as', isEqualTo: "Nurse").get(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          List<DocumentSnapshot> documents = snapshot.data!.docs;
                          return ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: documents.length,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot document = documents[index];
                              if (document
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
                                                "${document.get('name')}",
                                                style: GoogleFonts.ibarraRealNova(
                                                    fontWeight: FontWeight.bold, fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 22),
                                              child: Text(
                                                "Id : ${document.get('staff-id')}",
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
                                                selectedNurses[index] = document.get('name');
                                              }
                                              else{
                                                selectedNurses[index] = "not";
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
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            longButton("Confirm", () {
                for (var i = 0; i <= selectedNurses.length-1; i++) {
                  if(selectedNurses[i] != "not"){
                    selected.add(selectedNurses[i]);
                  }
                }
                shift.add({
                  'date':widget.date,
                  'time':widget.time,
                  'nurses':selected
                });
                Navigator.pop(context);
                Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }
}