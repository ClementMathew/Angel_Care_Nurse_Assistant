import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Colors/Colors.dart';
import '../Provider/provider.dart';
import '../Welcome Screens/WelcomePage.dart';
import 'PatientPage.dart';

class MedicationsPage extends StatefulWidget {
  final name;
  final phone;
  const MedicationsPage({super.key, this.name, this.phone});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MedicationsPage> {
  List<String> displayTextList = [];

  void _addString(String input) {
    setState(() {
      displayTextList.add(input);
    });
  }

  Future<void> _showAddTextDialog() async {
    String inputText = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Medications',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: TextField(
            onChanged: (input) {
              inputText = input;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme,
                ),
                onPressed: () {
                  _addString(inputText);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Medications',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Padding(
            padding: EdgeInsets.only(top: 20,bottom: 10),
            child: Text("-----  Press the '+' button to add medications  -----",style: TextStyle(fontSize: 18,color: Colors.black54),),
          ),
            const SizedBox(height: 2,),
            Expanded(
              child: ListView.builder(
                itemCount: displayTextList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), // shadow color
                          spreadRadius: 1, // how spread the shadow should be
                          blurRadius: 5, // how blurred the shadow should be
                          offset: const Offset(0, 2),)],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text('${index + 1}.  ${displayTextList[index]}',
                            style: const TextStyle(color: Colors.black87,
                                fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [const SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      String name = widget.name;
                      DocumentReference documentRef = FirebaseFirestore.instance.collection('Patients').doc(name.split(" ")[0]+widget.phone.toString());

                      // Define the field and value you want to add
                      Map<String, dynamic> data = {
                        'medications': displayTextList,
                      };

                      // Update the document with the new field
                      documentRef.update(data).then((_) {
                        print('Field added successfully.');
                        Navigator.pop(context);
                        var tagprovider = Provider.of<TagProvider>(context, listen: false);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatientPage(
                                  name: tagprovider.getName,
                                  age: tagprovider.getAge,
                                  date: tagprovider.getDate,
                                  disease: tagprovider.getDisease,
                                  phone: tagprovider.getPhone,
                                  medications: tagprovider.getMedications,
                                imagelink: tagprovider.getImageLink,
                                user: "Clement Mathew",
                                  ),
                            ));
                      }).catchError((error) {
                        print('Error adding field: $error');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme,
                        fixedSize: Size(width * .6, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    child: const Text(
                      "Done",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _showAddTextDialog();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: theme,
                          fixedSize: Size(width * .1, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      )),const SizedBox(width: 10,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}