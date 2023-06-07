import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Colors/Colors.dart';
import '../Provider/provider.dart';
import '../Welcome Screens/WelcomePage.dart';

Widget myDatePickerColor(BuildContext context, final controller, String hint) {
  var tagProvider = Provider.of<TagProvider>(context);

  return SizedBox(
    width: width * .83,
    child: TextField(
      readOnly: true,
      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        fillColor: background,
          filled: true,
          suffixIcon: IconButton(
              icon: const Icon(Icons.date_range),
              onPressed: () async {
                tagProvider.changeDate(context, controller);
              }),
          suffixIconColor: Colors.black45,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 16, color: theme, letterSpacing: .2),
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
      controller: controller,
    ),
  );
}