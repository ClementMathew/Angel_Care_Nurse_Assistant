import 'package:flutter/material.dart';

class NurseHome extends StatefulWidget {
  const NurseHome({Key? key}) : super(key: key);

  @override
  State<NurseHome> createState() => _NurseHomeState();
}

class _NurseHomeState extends State<NurseHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(74),
          child: AppBar(
            toolbarHeight: 75,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(21),bottomRight: Radius.circular(21)),
              ),
            ),
            title: const Text('Nurse Name',style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),),
            //centerTitle: true,
            backgroundColor: const Color.fromRGBO(82, 164, 80, 1),
            foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
            leading: IconButton(
              onPressed: (){
                //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>MyWidget()));
              },
              icon: const Icon(
                Icons.account_circle_rounded,
                color: Color.fromRGBO(255, 255, 255, 1),
                size: 29.39,
              ),
            ),
            actions: [
              IconButton(onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    size: 24.0,
                  )
              ),
              IconButton(onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: 750,
              width: 400,
              color: const Color.fromRGBO(82, 164, 80, 1),
              child: Stack(
                //alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 390,
                      width: 400,
                      child : const Image(
                        image: AssetImage("assets/female-psychologist-consulting-patient-desk-hospital 1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 17,top: 93,left: 28,bottom: 60),
                    child: Image(
                      image: AssetImage("assets/Angel Care1.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 377.5,bottom: 50),
                    child: Container(
                      height: 350,
                      width: 400,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(width: 2,color: Colors.green),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(21),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(50, 5, 0, 0),
                                  child: Icon(
                                    Icons.qr_code_scanner,
                                    size: 43.5,
                                    color: Color.fromRGBO(82, 164, 80, 1),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(50, 5, 0, 0),
                                  child: Text(
                                    "Scan QR Code",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color.fromRGBO(82, 164, 80, 1),
                            indent: 40,
                            endIndent: 40,
                            thickness: 2,
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(50, 5, 0, 0),
                                  child: Icon(
                                      Icons.medical_information_outlined,
                                      size: 43.5,
                                      color: Color.fromRGBO(82, 164, 80, 1)
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(50, 5, 0, 0),
                                  child: Text(
                                    "Patients Assigned ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color.fromRGBO(82, 164, 80, 1),
                            indent: 40,
                            endIndent: 40,
                            thickness: 2,
                          ),
                          InkWell(
                            onTap: (){
                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>const Pharmpage()));
                            },
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(50, 5, 0, 0),
                                  child: Icon(
                                      Icons.medication,
                                      size: 43.5,
                                      color: Color.fromRGBO(82, 164, 80, 1)
                                  ),
                                ),
                                Padding(
                                  padding:EdgeInsets.fromLTRB(50, 5, 0, 0),
                                  child: Text(
                                    "Pharmacy",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
