import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Reusables/buttons.dart';

import '../Colors/Colors.dart';
import '../Nurse/pharmacyPage.dart';
import '../Welcome Screens/WelcomePage.dart';

class ShiftTimePage extends StatefulWidget {
  const ShiftTimePage({Key? key}) : super(key: key);

  @override
  State<ShiftTimePage> createState() => _ShiftTimePageState();
}

class _ShiftTimePageState extends State<ShiftTimePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Morning',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: height * .018,
            backgroundColor: Colors.white,
            child: Text(
              "2",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: theme),
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .012,
                    ),
                    mySearch(searchController),
                    SizedBox(
                      height: height * .008,
                    ),
                    const nurseShiftSelect(),
                    const nurseShiftSelect(),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            longButton("Confirm", () {

            })
          ],
        ),
      ),
    );
  }
}

class nurseShiftSelect extends StatefulWidget {
  const nurseShiftSelect({Key? key}) : super(key: key);

  @override
  State<nurseShiftSelect> createState() => _nurseShiftSelectState();
}

class _nurseShiftSelectState extends State<nurseShiftSelect> {

  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: width * .9,
        height: height * .12,
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
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text(
                    "Id : 50654",
                    style: GoogleFonts.ibarraRealNova(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(height: .5),
              ],
            ),
            const Spacer(),
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(color: theme, width: 2)),
                checkColor: Colors.white,
                activeColor: theme,
                value: isChecked,
                shape: const CircleBorder(),
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}