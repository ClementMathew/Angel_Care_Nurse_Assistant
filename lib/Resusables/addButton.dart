import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';

class MyAddButton extends StatefulWidget {
  final page;
  const MyAddButton({Key? key, this.page}) : super(key: key);

  @override
  State<MyAddButton> createState() => _MyAddButtonState();
}

class _MyAddButtonState extends State<MyAddButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => widget.page,));},
      child: Container(
        height: 25,
        width: 40,
        decoration: BoxDecoration(
          color: theme,
          shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(8)
        ),
        child: const Icon(Icons.add,color: Colors.white,size: 20,),
      ),
    );
  }
}