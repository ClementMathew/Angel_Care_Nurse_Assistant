import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Resusables/buttons.dart';

import '../Colors/Colors.dart';
import '../Nurse/pharmacyPage.dart';
import '../Welcome Screens/WelcomePage.dart';

class PatientToNursePage extends StatefulWidget {
  const PatientToNursePage({Key? key}) : super(key: key);

  @override
  State<PatientToNursePage> createState() => _PatientToNursePageState();
}

class _PatientToNursePageState extends State<PatientToNursePage> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Nurses List',
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
                    const nurseSelect(val: 'male'),
                    const nurseSelect(val: 'female'),
                    const SizedBox(height: 10,)
                  ],
                ),
              ),
            ),const SizedBox(height: 15,),longButton("Assign", (){})
          ],
        ),
      ),
    );
  }
}

class nurseSelect extends StatefulWidget {
  final String val;
  const nurseSelect({Key? key, required this.val}) : super(key: key);

  @override
  State<nurseSelect> createState() => _nurseSelectState();
}

class _nurseSelectState extends State<nurseSelect> {

  String? gender;

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
            borderRadius: const BorderRadius.all(Radius.circular(18),
            )
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: .5),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text("Clement Mathew",
                    style: GoogleFonts.ibarraRealNova(
                        fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text("Id : 50689", style: GoogleFonts.ibarraRealNova(
                      fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                const SizedBox(height: .5),
              ],
            ),
            const Spacer(),
            Transform.scale(scale: 1.5,
              child: Radio(
                  fillColor: MaterialStateColor.resolveWith(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return theme;
                      }
                      return theme;
                    },
                  ),
                  value: widget.val,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  }),
            ),const SizedBox(width: 5,),
          ],
        ),
      ),
    );
  }
}