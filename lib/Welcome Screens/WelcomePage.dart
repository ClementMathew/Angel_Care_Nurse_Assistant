import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Welcome Screens/LoginPage.dart';
import 'package:nurse_assistant/Welcome%20Screens/RegisterPage.dart';

import 'OTPPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
            child: Column(
              children: [
                SizedBox(
                  height: height * .17,
                ),
                SizedBox(
                    height: height * .35,
                    child: Image.asset("assets/images/Splash.png")),
                SizedBox(
                  height: height * .1,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme,
                      fixedSize: Size(width * .74, height * .065),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text('Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          fontSize: 18)),
                ),
                SizedBox(
                  height: height * .045,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 2.0, color: theme),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: Size(width * .74, height * .065)),
                  child: Text('Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: 18,
                        color: theme,
                      )),
                ),
                SizedBox(
                  height: height * .05,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPPage()));
                  },
                  style: TextButton.styleFrom(fixedSize: const Size(188, 13)),
                  child: Text('Forgot Password ?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: .2,
                        color: theme,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
