import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 228, 229, 1),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 181, 0, 0),
              child: Image.asset('assets/images/Splash.png'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 89, 0, 0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(82, 164, 80, 1),
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
                    side: const BorderSide(
                        width: 2.0, color: Color.fromRGBO(82, 164, 80, 1)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fixedSize: const Size(240, 50)),
                child: const Text('Sign up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                      fontSize: 18,
                      color: Color.fromRGBO(82, 164, 80, 1),
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
                child: const Text('Forgot Password ?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: .2,
                      color: Color.fromRGBO(82, 164, 80, 1),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
