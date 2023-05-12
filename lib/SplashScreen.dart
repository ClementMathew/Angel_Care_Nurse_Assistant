import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Welcome Screens/WelcomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var size,height,width;

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * .20,
              ),
              Container(
                  height: height * .35,
                  child: Image.asset("assets/images/Splash.png")),
              SizedBox(height: height*.2,),
              Center(
                child: Container(
                  color: Colors.transparent,
                  height: height*.045,
                  width: height*.045,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
