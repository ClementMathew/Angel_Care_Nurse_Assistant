import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class ReportUploadPage extends StatefulWidget {
  const ReportUploadPage({Key? key}) : super(key: key);

  @override
  State<ReportUploadPage> createState() => _ReportUploadPageState();
}

class _ReportUploadPageState extends State<ReportUploadPage> {

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'Medical Reports/${nameControl.text.split(" ")[0]+phoneControl.text}/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {
      const snackBar = SnackBar(content: Text("Done"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');

    setState(() {
      uploadTask = null;
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDocumentById(
      String documentId) {
    return FirebaseFirestore.instance
        .collection('Patients')
        .doc(documentId)
        .get();
  }

  bool isVisible = false;

  TextEditingController nameControl = TextEditingController();
  TextEditingController phoneControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        appBar: AppBar(
          toolbarHeight: height * .085,
          backgroundColor: theme,
          title: const Text(
            'Medical Report',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: SizedBox(
                    width: width * .8,
                    child: TextField(
                      controller: nameControl,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(
                              fontSize: 17, color: theme, letterSpacing: .2),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: theme, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: theme, width: 2)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: theme, width: 2)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: theme, width: 2)),
                          hintText: "Enter Patient Name",
                          hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * .8,
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: phoneControl,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: TextStyle(
                            fontSize: 17, color: theme, letterSpacing: .2),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: theme, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: theme, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: theme, width: 2)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: theme, width: 2)),
                        hintText: "Patient Phone Number",
                        hintStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      String id =
                          nameControl.text.split(" ")[0] + phoneControl.text;

                      getDocumentById(id).then(
                          (DocumentSnapshot<Map<String, dynamic>> snapshot) {
                        if (snapshot.exists) {
                          setState(() {
                            isVisible = true;
                          });
                        } else {
                          print('Document does not exist.');
                          setState(() {
                            isVisible = false;
                          });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme,
                        fixedSize: Size(width * .4, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    child: const Text(
                      "Done",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                isVisible
                    ? Column(
                        children: [
                          TextButton(
                              onPressed: selectFile,
                              style: ButtonStyle(
                                  maximumSize: MaterialStateProperty.all(
                                      Size(width * .8, 60))),
                              child: Text(
                                pickedFile != null
                                    ? pickedFile!.name
                                    : "Select File",
                                style: const TextStyle(fontSize: 18),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                uploadFile();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: theme,
                                  fixedSize: Size(width * .4, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              child: const Text(
                                "Upload",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  pickedFile = null;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: theme,
                                  fixedSize: Size(width * .4, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              child: const Text(
                                "Add New",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(height: height*.17,),
                buildProgress()
              ],
            ),
          ),
        ));
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;

          return SizedBox(
            height: 50,
            child: Center(
              child: Stack(fit: StackFit.expand, children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white,
                  color: theme,
                ),
                Center(
                  child: Text(
                    '${(100 * progress).roundToDouble()}%',
                    style: TextStyle(
                        color: (100 * progress < 45) ? theme : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
          );
        } else {
          return const SizedBox(
            height: 50,
          );
        }
      });
}