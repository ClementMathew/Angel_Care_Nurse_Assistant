import 'package:flutter/material.dart';
import 'package:nurse_assistant/Welcome%20Screens/WelcomePage.dart';

Widget MRButton(String content) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: InkWell(
      onTap: (){},
      child: Container(
        height: height * .08,
        width: width * .88,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // shadow color
                spreadRadius: 1, // how spread the shadow should be
                blurRadius: 2, // how blurred the shadow should be
                offset: const Offset(0, 2),
              )
            ],
            color: const Color.fromRGBO(0, 172, 200, 1),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(
          content,
          style: const TextStyle(shadows: [
            Shadow(
              blurRadius: 7, // shadow blur
              color: Colors.black45, // shadow color
              offset: Offset(0, 1), // how much shadow will be shown
            ),
          ], fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,letterSpacing: .5),
        )),
      ),
    ),
  );
}