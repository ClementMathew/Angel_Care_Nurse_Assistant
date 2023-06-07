import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Reusables/textFields.dart';
import '../Welcome Screens/WelcomePage.dart';

class CreateQRPage extends StatefulWidget {
  const CreateQRPage({Key? key}) : super(key: key);

  @override
  State<CreateQRPage> createState() => _CreateQRPageState();
}

class _CreateQRPageState extends State<CreateQRPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        appBar: AppBar(
          toolbarHeight: height * .085,
          backgroundColor: theme,
          title: const Text(
            "Create QR Code",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: height*.08),
                QrImageView(
                  data: controller.text,
                  backgroundColor: secondary,
                  size: 250,
                ),SizedBox(height: height*.08),
                textField(false, false, null, "Enter the data", controller),SizedBox(height: height*.08),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme,
                      fixedSize: Size(width * .70, height * .065),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text('Create',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: .5)),
                ),SizedBox(height: height*.04),ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme,
                      fixedSize: Size(width * .70, height * .065),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text('Print',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: .5)),
                ),
              ],
            ),
          ),
        ));
  }
}