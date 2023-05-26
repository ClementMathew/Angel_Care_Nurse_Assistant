import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Nurse/profileEditPage.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        appBar: AppBar(
          toolbarHeight: height * .085,
          backgroundColor: theme,
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileEditPage()));
                },
                icon: const Icon(Icons.edit)),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: height * .04,
            ),
            CircleAvatar(
              radius: width * .26,
              backgroundColor: theme,
              child: ClipOval(
                child: Align(
                  widthFactor: .96,
                  child: CircleAvatar(
                    radius: width * .245,
                    backgroundColor: background,
                    child: Icon(Icons.add_a_photo, size: width * .18, color: theme),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              "Clement Mathew",
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: height * .46,
              width: width * .88,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                  border: Border(
                      bottom: BorderSide(color: theme, width: 2),
                      top: BorderSide(color: theme, width: 7),
                      left: BorderSide(color: theme, width: 5),
                      right: BorderSide(color: theme, width: 5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  profileText("Staff Id : ", "22765", false),
                  profileText("Phone : ", "8156819141", false),
                  profileText("Email : ", "clementmathew924@gmail.com", false),
                  profileText("Blood Group : ", "O +ve", true),
                  profileText("Working as : ", "Nurse", true),
                ],
              ),
            )
          ]),
        ));
  }
}

Widget profileText(detail, content, bool isShort) {
  return Padding(
    padding: const EdgeInsets.only(left: 35, top: 25),
    child: Row(
      children: [
        SizedBox(
            width: isShort ? width * .31 : width * .21,
            child: Text(
              detail,
              style: GoogleFonts.roboto(
                  color: theme, fontSize: 20, fontWeight: FontWeight.bold),
            )),
        SizedBox(
            width: isShort ? width * .35 : width * .46,
            child: Text(
              content,
              style: GoogleFonts.roboto(
                  fontSize: 20, fontWeight: FontWeight.bold, height: 1.6),
            )),
      ],
    ),
  );
}