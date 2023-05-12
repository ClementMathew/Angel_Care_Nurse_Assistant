import 'package:flutter/material.dart';

class medicationspg extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<medicationspg> {
  List<String> _displayTextList = [];

  void _addString(String input) {
    setState(() {
      _displayTextList.add(input);
    });
  }

  Future<void> _showAddTextDialog() async {
    String inputText = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Medications'),
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
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(82, 164, 80, 1),
              ),
              onPressed: () {
                _addString(inputText);
                Navigator.of(context).pop();
              },
              child: const Text('Add Medications'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(228, 228, 228, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(82, 164, 80, 1),
        toolbarHeight: 75,
        title: const Text('Medications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _displayTextList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('${index + 1}'),
                    title: Text(_displayTextList[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 56),
                  backgroundColor: const Color.fromRGBO(82, 164, 80, 1),
                ),
                onPressed: () => _showAddTextDialog(),
                child: const Text('Add Medications'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
