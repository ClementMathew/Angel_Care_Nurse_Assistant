import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

Widget textFieldColor(
    bool isPasswordType,bool isPhoneType, String? name, String hint, final control) {
  return SizedBox(
    width: width * .83,
    child: TextField(
        inputFormatters:isPhoneType ? [FilteringTextInputFormatter.digitsOnly]:null,
        controller: control,
        obscureText: isPasswordType,
        style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          fillColor: Colors.white,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: name,
            labelStyle:
            TextStyle(fontSize: 16, color: theme, letterSpacing: .2),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: background, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: background, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: background, width: 1)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: background, width: 1)),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal)),
        maxLength: checkLen(hint),
        keyboardType:
        isPasswordType ? TextInputType.visiblePassword : check(hint)),
  );
}

int? checkLen(String hint) {
  if (hint == "Phone Number") {
    return 10;
  } else {
    return null;
  }
}

TextInputType check(String hint) {
  if (hint == "Phone Number") {
    return TextInputType.phone;
  } else if (hint == "Email") {
    return TextInputType.emailAddress;
  } else {
    return TextInputType.text;
  }
}