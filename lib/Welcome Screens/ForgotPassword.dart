import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';

import '../Reusables/buttons.dart';
import '../Reusables/textFields.dart';
import 'WelcomePage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController rePasswordTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

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
                      height: height * .05,
                    ),
                    textField(true, false, null, "New Password",
                        passwordTextController),
                    SizedBox(height: height * .05),
                    textField(true, false, null, "Retype password",
                        rePasswordTextController),
                    SizedBox(
                      height: height * .07,
                    ),
                    filledButton(context, "Change Password", false, null, (){}),
                    SizedBox(
                      height: height*.06,
                    )
                  ])),
            )));
  }
}