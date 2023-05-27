import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Welcome%20Screens/WelcomePage.dart';

Widget MyArrowButton (context,page){
  return InkWell(
    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => page,));},
    child: Container(
      height: height*.08,
      width: width*.09,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: theme,
        borderRadius: BorderRadius.circular(12)
      ),
      child: const Icon(Icons.arrow_forward_ios,size: 22,color: Colors.white,),
    ),
  );
}