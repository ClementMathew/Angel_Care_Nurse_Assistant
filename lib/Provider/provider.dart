import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String theEmail = "";
String thePassword = "";
String theName = "";
String theAge = "";
String theDate = "";
String theDisease = "";
String thePhone = "";

class TagProvider with ChangeNotifier {

  CollectionReference patient = FirebaseFirestore.instance.collection('Patients');

  String get getEmail => theEmail;
  String get getPassword => thePassword;
  String get getName => theName;
  String get getAge => theAge;
  String get getDate => theDate;
  String get getDisease => theDisease;
  String get getPhone => thePhone;

  void changeDate(BuildContext context, final controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime.now());

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement
      controller.text = formattedDate; //set output date to TextField value.
    } else {
      print("Date is not selected");
    }
    notifyListeners();
  }

  void changeMenu() {
    notifyListeners();
  }

  giveUser(email, password) {
    theEmail = email;
    thePassword = password;
  }

  giveData(name,age,date,disease,phone) {
    theName = name;
    theAge = age;
    theDate = date;
    theDisease = disease;
    thePhone = phone;
  }

}