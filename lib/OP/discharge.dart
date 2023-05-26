import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class DischargePage extends StatefulWidget {
  const DischargePage({Key? key}) : super(key: key);

  @override
  State<DischargePage> createState() => _DischargePageState();
}

class _DischargePageState extends State<DischargePage> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Discharge',
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
              patientDis(),
              patientDis(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget patientDis() {
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
                  "Name : Clement Mathew",
                  style: GoogleFonts.ibarraRealNova(
                      fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text(
                  "Bed Number : 506",
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
                Icons.delete,
                color: theme,
                size: 33,
              )),
          const SizedBox(width: 5,)
        ],
      ),
    ),
  );
}