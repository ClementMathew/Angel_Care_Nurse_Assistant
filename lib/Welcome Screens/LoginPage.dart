import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: background,
            body: Center(
                child: ListView(children: [
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
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 91, 0, 0),
                child: Image.asset("assets/images/Splash.png"),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: TextField(
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
              const SizedBox(height: 37),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: TextField(
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
              const SizedBox(
                height: 58,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(56, 0, 56, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme,
                      fixedSize: const Size(249, 51),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text('Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: .5)),
                ),
              ),
            ]))));
  }
}
