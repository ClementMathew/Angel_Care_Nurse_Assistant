import 'package:flutter/material.dart';

class description extends StatelessWidget {
  // const description({Key? key}) : super(key: key);

  final String medicineName;
  final String medicineDescription;

  const description(
      {required this.medicineName, required this.medicineDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(228, 228, 228, 1),
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: const Color.fromRGBO(82, 164, 80, 1),
        title: const Text(
          "Description",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
      body: Center(
        child: Card(
          color: Color.fromRGBO(255, 255, 255, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicineName,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  medicineDescription,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
