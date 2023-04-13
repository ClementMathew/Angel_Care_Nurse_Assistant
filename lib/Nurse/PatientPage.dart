import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';

import 'medications.dart';
import 'SymptomsPage.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 75,
        backgroundColor: theme,
        title: Text(
          "Patient Record",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,letterSpacing: 1),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active_sharp,
                size: 32,
              )),SizedBox(width: 15,)
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 159,
                width: 167,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 6,
                        color: const Color.fromRGBO(82, 164, 80, 1)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    )),
                child: Image.asset(
                    'assets/png-clipart-goku-vegeta-kaiō-gotenks-frieza-goku-face-fictional-character.png'),
              ),
              Column(
                children: const [
                  SizedBox(
                    width: 116,
                    height: 75,
                    child: Text(
                      "Clement Mathew",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    label: Text(
                      "Age : 21",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Ibarra_Real_Nova',
                          fontWeight: FontWeight.w600),
                    ),
                    elevation: 10,
                  ),
                ],
              )
            ],
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Admitted Date :",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Phone :",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.phone,
                        size: 28.5,
                      ),
                      color: const Color.fromRGBO(82, 164, 80, 1),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Disease : ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                /*    IconButton(onPressed: () {},
                    icon: const Icon(Icons.phone),
                  color: const Color.fromRGBO(82, 164, 80, 1),
                ),*/
              ],
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    "Symptoms",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_box_rounded),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => SymptomsPage()));
                    },
                    color: const Color.fromRGBO(82, 164, 80, 1),
                  ),
                )
              ],
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    "Medications",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_box_rounded),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              medicationspg()));
                    },
                    color: const Color.fromRGBO(82, 164, 80, 1),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Previous Medical Records "),
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(82, 164, 80, 1),
                fixedSize: const Size(308, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                )),
          )
        ],
      ),
    );
  }
}