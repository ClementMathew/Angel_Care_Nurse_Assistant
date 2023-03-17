import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Welcome Screens/LoginPage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 161, 0, 0),
                child: Image.asset('assets/images/Splash.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 89, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme,
                      fixedSize: const Size(240, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text('Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          fontSize: 18)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 37, 0, 0),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          width: 2.0, color: theme),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: const Size(240, 50)),
                  child: Text('Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        fontSize: 18,
                        color: theme,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  style: TextButton.styleFrom(fixedSize: const Size(188, 13)),
                  child: Text('Forgot Password ?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: .2,
                        color: theme,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
