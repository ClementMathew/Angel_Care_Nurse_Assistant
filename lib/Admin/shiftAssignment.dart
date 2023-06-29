import 'package:flutter/material.dart';
import 'package:nurse_assistant/Admin/patientAssignment.dart';
import 'package:nurse_assistant/Admin/shiftTime.dart';
import 'package:provider/provider.dart';

import '../Colors/Colors.dart';
import '../Provider/provider.dart';
import '../Welcome Screens/WelcomePage.dart';

class ShiftAssignPage extends StatefulWidget {
  const ShiftAssignPage({Key? key}) : super(key: key);

  @override
  State<ShiftAssignPage> createState() => _ShiftAssignPageState();
}

class _ShiftAssignPageState extends State<ShiftAssignPage> {

  TextEditingController shiftController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var tagProvider = Provider.of<TagProvider>(context);

    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        toolbarHeight: height * .085,
        backgroundColor: theme,
        title: const Text(
          'Shift Assignment',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),body:
    Center(
      child: Column(
        children: [const SizedBox(height: 30),
          SizedBox(
        width: width * .8,
        child: TextField(
          readOnly: true,
          style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              fillColor: background,
              filled: true,
              prefixIcon: IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () async {
                    tagProvider.changeDate(context, shiftController);
                  }),
              prefixIconColor: Colors.black45,
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
              hintText: 'Pick a date',
              hintStyle: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal)),
          controller: shiftController,
        ),
      ),
          const SizedBox(height: 7,),
          block(context,"Morning",ShiftTimePage(time: "Morning",date: shiftController.text,)),
          block(context,"Evening",ShiftTimePage(time: "Evening",date: shiftController.text,)),
          block(context,"Night",ShiftTimePage(time: "Night",date: shiftController.text,)),
        ],
      ),
    ),);
  }
}