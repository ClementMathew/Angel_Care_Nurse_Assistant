import 'package:flutter/material.dart';

import '../Colors/Colors.dart';
import '../Reusables/buttons.dart';
import 'ForgotPassword.dart';
import 'WelcomePage.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  bool otpVisibility = false;
  String verificationID = "";

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          backgroundColor: background,
          body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
                  backButton(context),
                  SizedBox(
                    height: height * .07,
                  ),
                  SizedBox(
                      height: height * .35,
                      child: Image.asset("assets/images/Splash.png")),
                  SizedBox(
                    height: height * .03,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * .1, 20, width * .1, 0),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      style: const TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Enter the Number (with +91)",
                          hintStyle:
                          const TextStyle(color: Colors.black, fontSize: 15),
                          labelText: "Phone Number",
                          labelStyle: TextStyle(
                              fontSize: 16, color: theme, letterSpacing: .2),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: theme, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: theme, width: 2))),
                    ),
                  ),
                  Visibility(
                    visible: otpVisibility,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(width * .1, 20, width * .1, 0),
                      child: TextField(
                        controller: otpController,
                        style: const TextStyle(fontSize: 15),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Enter the OTP",
                            labelText: "One Time Password",
                            hintStyle: const TextStyle(
                                color: Colors.black, fontSize: 15),
                            labelStyle: TextStyle(
                                fontSize: 16, color: theme, letterSpacing: .2),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: theme, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: theme, width: 2))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .07,
                  ),
                  filledButton(
                    context,
                    otpVisibility ? "Confirm" : "Send OTP",
                    false,
                    null, (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword(),));
                  }),
                  SizedBox(
                    height: height*.06,
                  )
                ])),
          )
      ),
    );
  }
}