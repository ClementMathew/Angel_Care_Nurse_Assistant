import 'package:flutter/material.dart';
import 'package:nurse_assistant/Admin/patientSelection.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class PatientAssignPage extends StatefulWidget {
  const PatientAssignPage({Key? key}) : super(key: key);

  @override
  State<PatientAssignPage> createState() => _PatientAssignPageState();
}

class _PatientAssignPageState extends State<PatientAssignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
        'Patient Assignment',
        style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
    ),
    ),
    centerTitle: true,
    ),body:
      Center(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            block(context,"General Ward",const PatientSelectionPage(dept: "General Ward",)),
            block(context,"Operation Theatre",const PatientSelectionPage(dept: "Operation Theatre",)),
            block(context,"Casuality",const PatientSelectionPage(dept: "Casuality",)),
            block(context,"Intensive Care Unit",const PatientSelectionPage(dept: "Intensive Care Unit",)),
          ],
        ),
      ),);
  }
}

Widget block(context,String content,page){
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page,));},
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
          elevation: 3,
          backgroundColor: theme,
          fixedSize: Size(width*.8, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      child: Text(
        content,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
  );
}