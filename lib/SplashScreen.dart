
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Admin/HomePage.dart';
import 'Colors/Colors.dart';
import 'Doctor/HomePage.dart';
import 'Nurse/HomePage.dart';
import 'OP/HomePage.dart';
import 'Welcome Screens/WelcomePage.dart';

var size,height,width;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () async {

      final FirebaseAuth auth = FirebaseAuth.instance;
      final CollectionReference user =
      FirebaseFirestore.instance.collection('Users');

        if(FirebaseAuth.instance.currentUser != null){

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
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomePage(),));
        }

    });
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * .10,
              ),
              SizedBox(
                  height: height * .55,
                  child: Image.asset("assets/images/Splash.png")),
              SizedBox(height: height*.1,),
              Center(
                child: Container(
                  color: Colors.transparent,
                  height: height*.045,
                  width: height*.045,
                  child:  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}