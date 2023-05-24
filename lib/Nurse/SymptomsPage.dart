import 'package:flutter/material.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class SymptomsPage extends StatefulWidget {
  const SymptomsPage({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SymptomsPage> {
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
            'Symptoms',
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
          'Symptoms',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: displayTextList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
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
                        child: Text('${index + 1}. ${displayTextList[index]}',
                            style: const TextStyle(color: Colors.black87,
                                fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme,
                        fixedSize: Size(width * .65, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    child: const Text(
                      "Done",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _showAddTextDialog();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: theme,
                          fixedSize: Size(width * .15, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 35,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}