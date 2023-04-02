import 'package:flutter/material.dart';

import '../Colors/Colors.dart';
import 'ForgotPassword.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: background,
          body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        iconSize: 30,
                        icon: const Icon(Icons.arrow_back),
                        color: theme,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .07,
                  ),
                  SizedBox(
                      height: height * .35,
                      child: Image.asset("assets/images/Splash.png")),
                  SizedBox(
                    height: height * .05,
                  ),
                  SizedBox(
                    width: width * .8,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(
                              fontSize: 17, color: theme, letterSpacing: .2),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: theme, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: theme, width: 2)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: theme, width: 2)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: theme, width: 2)),
                          hintText: 'Enter OTP',
                          hintStyle: const TextStyle(color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: height * .07,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme,
                        fixedSize: Size(width * .70, height * .065),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text('Send OTP',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: .5)),
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword(),));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme,
                        fixedSize: Size(width * .70, height * .065),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text('Confirm',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: .5)),
                  ),
                  SizedBox(
                    height: height*.06,
                  )
                ])),
          )
      ),
    );
  }
}
