import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nurse_assistant/Admin/HomePage.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Doctor/HomePage.dart';
import 'package:nurse_assistant/Nurse/HomePage.dart';
import '../OP/HomePage.dart';
import '../Reusables/buttons.dart';
import '../Reusables/textFields.dart';
import 'WelcomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference user =
  FirebaseFirestore.instance.collection('Users');

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: background,
            body: SingleChildScrollView(
              child: Center(
                  child: Column(children: [
                backButton(context),
                SizedBox(
                  height: height * .07,
                ),
                SizedBox(
                    height: height * .35,
                    child: Image.asset("assets/images/Splash.png")),
                SizedBox(
                  height: height * .05,
                ),
                textField(false, false, "Username", "Enter the email",
                    emailTextController),
                SizedBox(height: height * .05),
                textField(true, false, "Password", "Enter the password",
                    passwordTextController),
                SizedBox(
                  height: height * .07,
                ),
                    loading
                        ? CircularProgressIndicator(
                      color: theme,
                    )
                        : filledButton(context, "Login", false, null, () async {setState(() {
                      loading = true;
                    });
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: emailTextController.text.trim(),
                        password: passwordTextController.text.trim())
                        .then((value) async {

                      DocumentReference reference = user.doc(auth.currentUser?.uid);
                      DocumentSnapshot documentSnapshot = await reference.get();

                      if(documentSnapshot.get('working-as') == 'Nurse')
                        {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NurseHome()),
                                  (route) => false);
                        }if(documentSnapshot.get('working-as') == 'Nurse Superintendent')
                        {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AdminHome()),
                                  (route) => false);
                        }if(documentSnapshot.get('working-as') == 'Doctor')
                        {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DoctorHome()),
                                  (route) => false);
                        }if(documentSnapshot.get('working-as') == 'Admission OP')
                        {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OPHome()),
                                  (route) => false);
                        }

                    }).onError((error, stackTrace) {
                      const snackBar =
                      SnackBar(content: Text("Invalid Credentials or Network Error"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      setState(() {
                        loading = false;
                      });
                    });}),
                SizedBox(
                  height: height * .06,
                )
              ])),
            )));
  }
}