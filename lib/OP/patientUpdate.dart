import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nurse_assistant/Reusables/buttons.dart';
import 'package:nurse_assistant/Reusables/datePickerColor.dart';
import '../Colors/Colors.dart';
import '../Reusables/textFieldColor.dart';
import '../Welcome Screens/WelcomePage.dart';

class PatientUpdate extends StatefulWidget {
  final name;
  final age;
  final date;
  final phone;
  final disease;
  final bed;
  final id;
  const PatientUpdate({Key? key, this.name, this.date, this.age, this.phone, this.disease, this.bed, this.id}) : super(key: key);

  @override
  State<PatientUpdate> createState() => _PatientUpdateState();
}

class _PatientUpdateState extends State<PatientUpdate> {

  @override
  void initState() {
    admissionDate.text = widget.date;
    super.initState();
  }

  bool loading = false;

  final CollectionReference user =
  FirebaseFirestore.instance.collection('Patients');

  TextEditingController nameTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController diseaseTextController = TextEditingController();
  TextEditingController bedTextController = TextEditingController();
  TextEditingController admissionDate = TextEditingController();

  void updateUser(docId) {
    final data = {
      'name': nameTextController.text,
      'age': ageTextController.text,
      'admission': admissionDate.text,
      'phone': phoneTextController.text,
      'disease': diseaseTextController.text,
      'bed': bedTextController.text,
    };
    user.doc(docId).update(data);
  }

  @override
  Widget build(BuildContext context) {

    nameTextController.text = widget.name;
    ageTextController.text = widget.age;
    phoneTextController.text = widget.phone;
    diseaseTextController.text = widget.disease;
    bedTextController.text = widget.bed;

    final docId = widget.id;

    return Scaffold(
        backgroundColor: secondary,
        appBar: AppBar(
          toolbarHeight: height * .085,
          backgroundColor: theme,
          title: const Text(
            'Edit Patient',
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
                  updateUser(docId);
                  Navigator.pop(context);
                }),
                SizedBox(height: height * .03),
              ])),
        )
    );
  }
}