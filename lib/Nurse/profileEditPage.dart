import 'package:flutter/material.dart';
import 'package:nurse_assistant/Nurse/profilePage.dart';
import '../Colors/Colors.dart';
import '../Reusables/buttons.dart';
import '../Reusables/dropDownColor.dart';
import '../Reusables/textFieldColor.dart';
import '../Welcome Screens/OTPPage.dart';
import '../Welcome Screens/RegisterPage.dart';
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

  void updateUser(docId) {
    final data = {
      'name': nameTextController.text,
      'phone': phoneTextController.text,
      'staff-id': staffIdTextController.text,
      'blood-grp': selectedGroup,
    };
    user.doc(docId).update(data);
  }

  bool loading = false;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController staffIdTextController = TextEditingController();

  @override
  void initState() {
    selectedGroup = editData['blood-grp'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments as Map;
    nameTextController.text = args['name'];
    phoneTextController.text = args['phone'];
    staffIdTextController.text = args['staff-id'];
    final docId = args['id'];

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
                    textFieldColor(false, false, null, "Staff Id Number", staffIdTextController),
                    SizedBox(height: height * .05),
                    loading ? CircularProgressIndicator(
                      color: theme,
                    ):longButton("Confirm",()async{
                      setState(() {
                        loading = true;
                      });
                      updateUser(docId);
                      Navigator.pop(context);
                    })
          ])),
        ));
  }
}