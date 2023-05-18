import 'package:flutter/material.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

class HomeList extends StatelessWidget {
  final int n;

  const HomeList({Key? key, required this.n}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height * .125 * n,
      width: width,
      decoration: BoxDecoration(
          color: secondary,
          border: Border.all(width: 2, color: theme),
          borderRadius: const BorderRadius.all(
            Radius.circular(22),
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 1))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: .01,
          ),
          homeButton(
              context, "Scan QR Code", null, Icons.qr_code_scanner_outlined),
          myDivider(),
          homeButton(context, "Patients Assigned", null, Icons.personal_injury),
          myDivider(),
          homeButton(context, "Pharmacy", null, Icons.medical_information),
          const SizedBox(
            height: .01,
          ),
        ],
      ),
    );
  }
}

Widget homeButton(context, String content, final page, IconData pic) {
  return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Row(
        children: [
          SizedBox(
            width: width * .15,
          ),
          Icon(pic, size: 43.5, color: theme),
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