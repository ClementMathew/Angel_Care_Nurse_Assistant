import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nurse_assistant/Admin/HomePage.dart';
import 'package:nurse_assistant/Doctor/HomePage.dart';
import 'package:nurse_assistant/Nurse/HomePage.dart';
import 'package:nurse_assistant/OP/HomePage.dart';

import '../Colors/Colors.dart';
import '../Reusables/buttons.dart';
import '../Reusables/dropDown.dart';
import '../Reusables/textFields.dart';
import 'WelcomePage.dart';

String selectedGroup = "Blood Group";
String selectedDept = "Working as";

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  List<String> groups = [
    'A Positive',
    'A Negative',
    'B Positive',
    'B Negative',
    'O Positive',
    'O Negative',
    'AB Positive',
    'AB Negative',
  ];

  List<String> departments = [
    'Nurse',
    'Nurse Superintendent',
    'Doctor',
    'Admission OP',
  ];

  TextEditingController nameTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController idTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController rePasswordTextController = TextEditingController();

  bool loading = false;

  final CollectionReference user =
  FirebaseFirestore.instance.collection('Users');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> updateUserData(
      String name,
      int phone,
      String email,
      String bloodGrp,
      String workingAs,
      String staffId,
      String password) async {
    return await user.doc(_auth.currentUser?.uid).set({
      'name': name,
      'phone': phone,
      'email': email,
      'blood-grp': bloodGrp,
      'working-as': workingAs,
      'staff-id': staffId,
      'password': password
    });
  }

  void addUser() {
    updateUserData(
        nameTextController.text,
        int.parse(phoneTextController.text),
        emailTextController.text,
        selectedGroup,
        selectedDept,
        idTextController.text,
        passwordTextController.text);
  }

  @override
  void initState() {
    selectedGroup = "Blood Group";
    selectedDept = "Working as";
    super.initState();
  }

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
                    textField(false,false, null, "Name", nameTextController),
                    SizedBox(height: height * .05),
                    textField(false, true,null, "Phone Number", phoneTextController),
                    SizedBox(height: height * .025),
                    textField(false,false, null, "Email", emailTextController),
                    SizedBox(height: height * .05),
                    MyDropDown(myList: departments,isEdit: false),
                    SizedBox(height: height * .05),
                    MyDropDown(myList: groups,isEdit: false),
                    SizedBox(height: height * .05),
                    textField(false,false, null, "Staff Id Number", idTextController),
                    SizedBox(height: height * .05),
                    textField(true, false,null, "New Password", passwordTextController),
                    SizedBox(height: height * .05),
                    textField(
                        true,false,  null, "Retype Password", rePasswordTextController),
                    SizedBox(
                      height: height * .07,
                    ),
                    loading
                        ? CircularProgressIndicator(
                      color: theme,
                    )
                        :filledButton(context, "Register", false, null, ()async{
                      setState(() {
                        loading = true;
                      });
                      if(nameTextController.text != "" &&
                          phoneTextController.text != "" &&
                          selectedGroup != "Blood Group" &&
                          idTextController.text != "" &&
                          selectedDept != "Working as"){
                        if (passwordTextController.text ==
                            rePasswordTextController.text
                        ) {
                          await _auth
                              .createUserWithEmailAndPassword(
                            email: emailTextController.text,
                            password: passwordTextController.text,
                          )
                              .then((value) {
                            if(selectedDept == "Nurse"){
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const NurseHome()),
                                      (route) => false);
                            }if(selectedDept == "Nurse Superintendent"){
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AdminHome()),
                                      (route) => false);
                            }if(selectedDept == "Doctor"){
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DoctorHome()),
                                      (route) => false);
                            }if(selectedDept == "Admission OP"){
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const OPHome()),
                                      (route) => false);
                            }
                            addUser();
                            print("Created New Account");
                          }).onError((error, stackTrace) {
                            var snackBar = const SnackBar(
                                content: Text(
                                    "Password should be at least 6 characters or Email already taken"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            setState(() {
                              loading = false;
                            });
                          });
                        } else {
                          const snackBar = SnackBar(
                              content: Text(
                                  "Invalid email or Passwords doesn't match"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          setState(() {
                            loading = false;
                          });
                        }}else{
                        var snackBar2 = const SnackBar(
                            content: Text(
                                "Please fill all fields"));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar2);

                        setState(() {
                          loading = false;
                        });
                      }
                    }),
                    SizedBox(
                      height: height*.06,
                    )
                  ])),
            )));
  }
}