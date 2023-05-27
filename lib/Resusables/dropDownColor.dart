
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Colors/Colors.dart';
import '../Provider/provider.dart';
import '../Welcome Screens/RegisterPage.dart';
import '../Welcome Screens/WelcomePage.dart';

class MyDropDownColor extends StatefulWidget {

  final List<String> myList;
  final bool isEdit;
  const MyDropDownColor({Key? key, required this.myList, required this.isEdit}) : super(key: key);

  @override
  State<MyDropDownColor> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDownColor> {

  late bool isFont = editCheck();

  editCheck()
  {
    if (widget.isEdit == true){
      return isFont = true;
    }
    else{
      return isFont = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return myDropDown(widget.myList, context);
  }


  Widget myDropDown(List<String> lists, BuildContext context) {
    bool isGroups;
    var tagProvider = Provider.of<TagProvider>(context);

    if (lists[0] == "A Positive") {
      isGroups = true;
    } else {
      isGroups = false;
    }

    return SizedBox(
      width: width * .83,
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: background,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: null,
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
          contentPadding: const EdgeInsets.all(3),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              hint: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(isGroups ? selectedGroup : selectedDept,
                    style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: isFont ?FontWeight.bold: FontWeight.normal)),
              ),
              borderRadius: BorderRadius.circular(20),
              autofocus: true,
              items: lists
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  isFont =true;
                });
                tagProvider.changeMenu();
                isGroups ? selectedGroup = value! : selectedDept = value!;
              }),
        ),
      ),
    );
  }
}