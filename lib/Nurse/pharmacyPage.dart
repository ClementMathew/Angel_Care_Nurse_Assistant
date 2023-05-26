import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_assistant/Resusables/arrowButton.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';
import 'descPage.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({Key? key}) : super(key: key);

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Pharmacy',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * .012,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: SizedBox(
                    height: height * .06,
                    width: width * .89,
                    child: SearchBar(
                      onChanged: (value) {
                        // changeSearch(value);
                      },
                      controller: searchController,
                      elevation: const MaterialStatePropertyAll(3),
                      trailing: const [
                        Padding(
                          padding: EdgeInsets.only(top: 3, right: 7),
                          child: Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                        )
                      ],
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.only(left: 15, right: 5, bottom: 2.3)),
                      hintText: "Search",
                      hintStyle: const MaterialStatePropertyAll(
                          TextStyle(color: Colors.black, fontSize: 18)),
                      textStyle: const MaterialStatePropertyAll(
                          TextStyle(color: Colors.black, fontSize: 18)),
                    )),
              ),
              SizedBox(
                height: height * .008,
              ),
              medicine(context),
              medicine(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget medicine(context){
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      height: height * .145,
      width: width * .9,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 3))
          ],
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Name : Paracetamol",
                  style: GoogleFonts.ibarraRealNova(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Quantity : 120",
                  style: GoogleFonts.ibarraRealNova(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(height: 1),
            ],
          ),
          const Spacer(),
          MyArrowButton(
              context,
              const DescriptionPage(
                medicineName: 'Paracetamol',
                medicineDescription:
                "Paracetamol is a commonly used medicine that can help treat pain and reduce a high temperature (fever). It's typically used to relieve mild or moderate pain, such as headaches, toothache or sprains, and reduce fevers caused by illnesses such as colds and flu.",
              )),
          SizedBox(
            width: width * .04,
          )
        ],
      ),
    ),
  );
}