import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nurse_assistant/Reusables/buttons.dart';
import 'package:nurse_assistant/Reusables/datePickerColor.dart';

import '../Colors/Colors.dart';
import '../Reusables/textFieldColor.dart';
import '../Welcome Screens/WelcomePage.dart';

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({Key? key}) : super(key: key);

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {

  bool loading = false;

  final CollectionReference user =
  FirebaseFirestore.instance.collection('Patients');

  TextEditingController nameTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController diseaseTextController = TextEditingController();
  TextEditingController bedTextController = TextEditingController();
  TextEditingController admissionDate = TextEditingController();

  Future<void> updateUserData(
      String name,
      String age,
      String admission,
      int phone,
      String disease,
      String bed,
      ) async {
    return await user.doc((name.split(" ")[0])+phone.toString()).set({
      'name': name,
      'age': age,
      'admission': admission,
      'phone': phone,
      'disease': disease,
      'bed': bed,
    });
  }

  void addPatient() {
    updateUserData(
        nameTextController.text,
        ageTextController.text,
        admissionDate.text,
        int.parse(phoneTextController.text),
        diseaseTextController.text,
        bedTextController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Add Patient',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
          child: Center(
              child:
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: height * .04,
                ),
                CircleAvatar(
                  radius: width * .23,
                  backgroundColor: theme,
                  child: const Text("Add Photo",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: .5),),
                ),
                const SizedBox(
                  height: 25,
                ),textFieldColor(false, false, null, "Name", nameTextController),
                SizedBox(height: height * .03),
                textFieldColor(false, true,null, "Patient Age", ageTextController),
                SizedBox(height: height * .03),
                myDatePickerColor(context, admissionDate, "Admitted Date"),
                SizedBox(height: height * .03),
                textFieldColor(false, true, null, "Phone Number", phoneTextController),
                SizedBox(height: height * .008),
                textFieldColor(false, false,null, "Disease", diseaseTextController),
                SizedBox(height: height * .03),
                textFieldColor(false, false,null, "Bed Number", bedTextController),
                SizedBox(height: height * .04),
                loading ? CircularProgressIndicator(
                  color: theme,
                ):longButton("Confirm", (){
                  setState(() {
                    loading = true;
                  });
                    addPatient();
                  Navigator.pop(context);
                }),
                SizedBox(height: height * .03),
              ])),
        )
    );
  }
}