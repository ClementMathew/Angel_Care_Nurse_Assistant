import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Resusables/textFields.dart';
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
        backgroundColor: background,
        appBar: AppBar(
          toolbarHeight: height * .085,
          backgroundColor: theme,
          title: const Text(
            "Scan QR Code",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QrImageView(
                data: controller.text,
                backgroundColor: Colors.white,
                size: 250,
              ),
              textField(false, false, null, "Enter the data", controller),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: theme,
                    fixedSize: Size(width * .70, height * .065),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text('Scan',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: .5)),
              ),
            ],
          ),
        ));
  }
}