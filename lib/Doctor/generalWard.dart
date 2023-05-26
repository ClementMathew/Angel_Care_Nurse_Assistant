import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class GeneralWardPage extends StatefulWidget {
  const GeneralWardPage({Key? key}) : super(key: key);

  @override
  State<GeneralWardPage> createState() => _GeneralWardPageState();
}

class _GeneralWardPageState extends State<GeneralWardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'General Ward',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            patientGW(),
            patientGW(),
          ],
        ),
      ),
    );
  }
}

Widget patientGW() {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Container(
      width: width * .9,
      height: height * .14,
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: theme),
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          )),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: .5),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text(
                  "Clement Mathew",
                  style: GoogleFonts.ibarraRealNova(
                      fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text(
                  "Id : 50654",
                  style: GoogleFonts.ibarraRealNova(
                      fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
              const SizedBox(height: .5),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active_sharp,
                color: theme,
                size: 33,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.phone,
                color: theme,
                size: 33,
              )),
          const SizedBox(
            width: 5,
          )
        ],
      ),
    ),
  );
}