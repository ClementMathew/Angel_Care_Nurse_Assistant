import 'package:flutter/material.dart';

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
                    filledButton(context, "Register", false, null, (){}),
                    SizedBox(
                      height: height*.06,
                    )
                  ])),
            )));
  }
}