import 'package:flutter/material.dart';
import 'package:nurse_assistant/Resusables/textFields.dart';

import '../Colors/Colors.dart';
import '../Resusables/buttons.dart';
import '../Resusables/dropDownColor.dart';
import '../Resusables/textFieldColor.dart';
import '../Welcome Screens/WelcomePage.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {

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
  TextEditingController staffIdTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        appBar: AppBar(
          toolbarHeight: height * .085,
          backgroundColor: theme,
          title: const Text(
            'Edit Profile',
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
              height: height * .035,
            ),
            CircleAvatar(
              radius: width * .24,
              backgroundColor: theme,
              child: ClipOval(
                child: Align(
                  widthFactor: .96,
                  child: CircleAvatar(
                    radius: width * .225,
                    backgroundColor: background,
                    child: Icon(Icons.add_a_photo, size: width * .18, color: theme),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),textFieldColor(false, false, null, "Name", nameTextController),
                    SizedBox(height: height * .03),
                    textFieldColor(false, true,null, "Phone Number", phoneTextController),
                    SizedBox(height: height * .008),
                    MyDropDownColor(myList: groups,isEdit: true,),
                    SizedBox(height: height * .03),
                    MyDropDownColor(myList: departments,isEdit: true,),
                    SizedBox(height: height * .03),
                    textFieldColor(false, false, null, "Staff Id Number", staffIdTextController),
                    SizedBox(height: height * .03),
                    longButton("Confirm",(){})
          ])),
        ));
  }
}