import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';

import '../Resusables/buttons.dart';
import '../Resusables/textFields.dart';
import 'WelcomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextController = TextEditingController();
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
                textField(false, false, "Username", "Enter the email",
                    emailTextController),
                SizedBox(height: height * .05),
                textField(true, false, "Password", "Enter the password",
                    passwordTextController),
                SizedBox(
                  height: height * .07,
                ),
                filledButton(context, "Login", false, null, () {}),
                SizedBox(
                  height: height * .06,
                )
              ])),
            )));
  }
}