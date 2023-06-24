import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nurse_assistant/Admin/attendersList.dart';
import 'package:nurse_assistant/Admin/nursesList.dart';
import 'package:nurse_assistant/Admin/patientAssignment.dart';
import 'package:nurse_assistant/Admin/patientList.dart';
import 'package:nurse_assistant/Admin/pharmacistsList.dart';
import 'package:nurse_assistant/Admin/reportUpload.dart';
import 'package:nurse_assistant/Admin/shiftAssignment.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/QR_Code/CreateQRPage.dart';
import 'package:nurse_assistant/Reusables/homeList.dart';
import '../Nurse/profilePage.dart';
import '../Reusables/popUpMenu.dart';
import '../Welcome Screens/WelcomePage.dart';
import 'doctorsList.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference user =
  FirebaseFirestore.instance.collection('Users');
  late DocumentReference reference = user.doc(auth.currentUser?.uid);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: theme,
                toolbarHeight: height * .085,
                title: StreamBuilder<DocumentSnapshot>(
                  stream: reference.snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Angel Care",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ));
                    }
                    if (snapshot.hasData) {
                      DocumentSnapshot docSnapshot = snapshot.data!;
                      String fieldData = (docSnapshot.get('name')).toString();
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ));
                        },
                        child: Text(
                          fieldData,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return const Text("Loading...");
                  },
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                  },
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                actions: const [
                  PopUpMenu(),SizedBox(
                    width: 5,
                  ),
                ]),
            body: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  height: height * 1.49,
                  width: width,
                  color: theme,
                ),
                SizedBox(
                  height: height * .53,
                  width: width,
                  child: const Image(
                    image: AssetImage("assets/images/Home.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height * .45,
                    ),
                    Container(
                      height: height * .11 * 9,
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
                            height: 10,
                          ),
                          homeButton(
                              context, "Create QR Code", const CreateQRPage(), 'assets/icons/admin/createqr.png'),
                          myDivider(),
                          homeButton(context, "Report Upload", const ReportUploadPage(),
                              'assets/icons/admin/reportupload.png'),
                          myDivider(),
                          homeButton(context, "Shift Assignment", const ShiftAssignPage(),
                              'assets/icons/admin/shiftassignment.png'),
                          myDivider(),
                          homeButton(context, "Patient Assignment", const PatientAssignPage(),
                              'assets/icons/admin/patientassignment.png'),
                          myDivider(),
                          homeButton(context, "Nurses List", const NursesListPage(),
                              'assets/icons/admin/nurseslist.png'),
                          myDivider(),
                          homeButton(context, "Patients List", const PatientListPage(),
                              'assets/icons/admin/patientslist.png'),
                          myDivider(),
                          homeButton(context, "Doctors List", const DoctorsListPage(),
                              'assets/icons/admin/doctorslist.png'),
                          myDivider(),
                          homeButton(context, "Pharmacists List", const PharmacistsListPage(),
                              'assets/icons/admin/pharmacistslist.png'),
                          myDivider(),
                          homeButton(context, "Attenders List", const AttendersListPage(),
                              'assets/icons/admin/attenderslist.png'),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            )));
  }
}