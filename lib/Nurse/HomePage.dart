import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';

import 'ScanQRPage.dart';

class NurseHome extends StatefulWidget {
  const NurseHome({Key? key}) : super(key: key);

  @override
  State<NurseHome> createState() => _NurseHomeState();
}

class _NurseHomeState extends State<NurseHome> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: height * .085,

              title: const Text(
                'Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              //centerTitle: true,
              backgroundColor: theme,

              leading: IconButton(
                onPressed: () {
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=> ));
                },
                icon: const Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 24.0,
                    )),
                const SizedBox(
                  width: 1,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 26,
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  height: height * .95,
                  color: theme,
                ),
                Column(
                  children: [
                    Container(
                      height: height * .5,
                      width: width,
                      child: const Image(
                        image: AssetImage("assets/images/Home.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: height * .4,
                      width: width,
                      decoration: BoxDecoration(
                        color: background,
                        border: Border.all(width: 3, color: theme),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(22),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: .01,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScanQRPage()));
                              },
                              child: Container(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: width * .15,
                                  ),
                                  Icon(Icons.qr_code_scanner,
                                      size: 43.5, color: theme),
                                  SizedBox(
                                    width: width * .07,
                                  ),
                                  const Text(
                                    "Scan QR Code",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ))),
                          Divider(
                            color: theme,
                            indent: 30,
                            endIndent: 30,
                            thickness: 1,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * .15,
                                ),
                                Icon(Icons.personal_injury,
                                    size: 43.5, color: theme),
                                SizedBox(
                                  width: width * .07,
                                ),
                                const Text(
                                  "Patients Assigned ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: theme,
                            indent: 30,
                            endIndent: 30,
                            thickness: 1,
                          ),
                          InkWell(
                            onTap: () {
                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>));
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * .15,
                                ),
                                Icon(Icons.medical_information,
                                    size: 43.5, color: theme),
                                SizedBox(
                                  width: width * .07,
                                ),
                                const Text(
                                  "Pharmacy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: .01,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ]),
            )));
  }
}