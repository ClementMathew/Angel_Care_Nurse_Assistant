import 'package:flutter/material.dart';

class assigned extends StatelessWidget {
  const assigned({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(228, 228, 228, 1),
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text("Patients Assigned ",style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        ),
        backgroundColor: const Color.fromRGBO(82, 164, 80, 1),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 50,
                width: 333,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(Radius.circular(18),)
                ),
                child: const Center(
                  child: Text("General Ward",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(82, 164, 80, 1)
                  ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: 333,
              height: 110,
              decoration: BoxDecoration(
                  border: Border.all(width: 3,color: const Color.fromRGBO(82, 164, 80, 1)),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(18),
                  )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(26, 19, 27, 14),
                    child: Row(
                      children: [
                        const Text("Name :",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26.0),
                    child: Row(
                      children: [
                        const Text("Bed No :",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
