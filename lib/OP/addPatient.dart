import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nurse_assistant/Reusables/buttons.dart';
import 'package:nurse_assistant/Reusables/datePickerColor.dart';

import '../Colors/Colors.dart';
import '../Nurse/pickImage.dart';
import '../Reusables/textFieldColor.dart';
import '../Welcome Screens/WelcomePage.dart';

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({Key? key}) : super(key: key);

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  bool loading = false;

  String imageUrl = "unknown";

  final CollectionReference user =
      FirebaseFirestore.instance.collection('Patients');

  final FirebaseStorage _storage = FirebaseStorage.instance;

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
      Uint8List file
  ) async {

    imageUrl = await uploadImageToStorage(name.split(" ")[0]+(phone).toString(), file);

    return await user.doc((name.split(" ")[0]) + phone.toString()).set({
      'name': name,
      'age': age,
      'admission': admission,
      'phone': phone,
      'disease': disease,
      'bed': bed,
      'image-link': imageUrl
    });
  }

  void addPatient() {
    updateUserData(
      nameTextController.text,
      ageTextController.text,
      admissionDate.text,
      int.parse(phoneTextController.text),
      diseaseTextController.text,
      bedTextController.text,_image!
    );
  }

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child("Profile Picture").child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
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
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: width * .23,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : CircleAvatar(
                        radius: width * .23,
                        backgroundImage: const AssetImage('assets/images/profile.png'),
                        backgroundColor: theme,
                      ),
                Positioned(
                    bottom: 2,
                    left: 110,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: theme,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            textFieldColor(false, false, null, "Name", nameTextController),
            SizedBox(height: height * .03),
            textFieldColor(false, true, null, "Patient Age", ageTextController),
            SizedBox(height: height * .03),
            myDatePickerColor(context, admissionDate, "Admitted Date"),
            SizedBox(height: height * .03),
            textFieldColor(
                false, true, null, "Phone Number", phoneTextController),
            SizedBox(height: height * .008),
            textFieldColor(
                false, false, null, "Disease", diseaseTextController),
            SizedBox(height: height * .03),
            textFieldColor(false, false, null, "Bed Number", bedTextController),
            SizedBox(height: height * .04),
            loading
                ? CircularProgressIndicator(
                    color: theme,
                  )
                : longButton("Confirm", () {
                    setState(() {
                      loading = true;
                    });
                    addPatient();
                    Navigator.pop(context);
                  }),
            SizedBox(height: height * .03),
          ])),
        ));
  }
}