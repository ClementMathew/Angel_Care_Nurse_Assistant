import 'package:flutter/material.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

Widget homeButton(context, String content, final page, var pic) {
  return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
      child: Row(
        children: [
          SizedBox(
            width: width * .12,
          ),
          SizedBox(
              height: 55,
              width: 55,
              child: IconButton(
                icon: ImageIcon(AssetImage(pic), size: 45, color: theme),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => page));
                },
              )),
          SizedBox(
            width: width * .07,
          ),
          Text(
            content,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ],
      ));
}

Widget myDivider() {
  return Divider(
    color: theme,
    indent: 25,
    endIndent: 25,
    thickness: 1,
  );
}