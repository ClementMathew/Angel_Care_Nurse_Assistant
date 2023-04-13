import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Nurse/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Username',
                        labelStyle: TextStyle(
                            fontSize: 17, color: theme, letterSpacing: .2),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: theme, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: theme, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: theme, width: 2)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: theme, width: 2)),
                        hintText: 'Enter email or phone number',
                        hintStyle: const TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(height: height * .05),
                SizedBox(
                  width: width * .8,
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            fontSize: 17, color: theme, letterSpacing: .2),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: theme, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: theme, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: theme, width: 2)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: theme, width: 2)),
                        hintText: 'Enter the password',
                        hintStyle: const TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: height * .07,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NurseHome(),));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme,
                      fixedSize: Size(width * .70, height * .065),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text('Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: .5)),
                ),
                    SizedBox(
                      height: height*.06,
                    )
              ])),
            )));
  }
}