import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Welcome Screens/LoginPage.dart';
import 'package:nurse_assistant/Welcome%20Screens/RegisterPage.dart';
import '../Reusables/buttons.dart';
import 'OTPPage.dart';

var size, height, width;

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

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
                  height: height * .16,
                ),
                SizedBox(
                    height: height * .35,
                    child: Image.asset("assets/images/Splash.png")),
                SizedBox(
                  height: height * .1,
                ),
                filledButton(context, "Login",true,const LoginPage(),(){}),
                SizedBox(
                  height: height * .045,
                ),
                outlineButton(context, "Sign Up",true,const RegisterPage(),(){}),
                SizedBox(
                  height: height * .05,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPPage()));
                  },
                  style: TextButton.styleFrom(fixedSize: const Size(188, 13)),
                  child:  Text('Forgot Password ?',
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