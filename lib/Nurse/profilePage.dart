import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/Colors.dart';
import '../Welcome Screens/WelcomePage.dart';

Map editData = {};

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    final FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference user = FirebaseFirestore.instance.collection('Users');
    DocumentReference docRef = user.doc(auth.currentUser?.uid);

    return Scaffold(
        backgroundColor: secondary,
        appBar: AppBar(
          toolbarHeight: height * .085,
          backgroundColor: theme,
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit', arguments: {
                    'name': editData['name'],
                    'phone' : editData['phone'],
                    'staff-id': editData['staff-id'],
                    'id':editData['id']
                  });
                },
                icon: const Icon(Icons.edit)),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: height * .04,
              ),
              CircleAvatar(
                radius: width * .26,
                backgroundColor: theme,
                child: ClipOval(
                  child: Align(
                    widthFactor: .96,
                    child: CircleAvatar(
                      radius: width * .245,
                      backgroundColor: background,
                      child: Icon(Icons.add_a_photo,
                          size: width * .18, color: theme),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              StreamBuilder<DocumentSnapshot>(
                stream: docRef.snapshots(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error...');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading...');
                  }
                  if (!snapshot.hasData) {
                    return const Text('No Data found');
                  }
                  DocumentSnapshot docSnapshot = snapshot.data!;
                  String fieldData = (docSnapshot.get('name')).toString();
                  editData['name'] = fieldData;

                  return Text(fieldData,style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 26));
                },
              ),
              SizedBox(
                height: height * .05,
              ),
              Container(
                height: height * .45,
                width: width * .88,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    border: Border(
                        bottom: BorderSide(color: theme, width: 2),
                        top: BorderSide(color: theme, width: 7),
                        left: BorderSide(color: theme, width: 5),
                        right: BorderSide(color: theme, width: 5))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: .1,
                    ),
                    profileText("Staff Id : ", "staff-id", false),
                    profileText("Phone : ", "phone", false),
                    profileText("Email : ", "email", false),
                    profileText("Blood Group : ", "blood-grp", true),
                    profileText("Working as : ", "working-as", true),
                    const SizedBox(
                      height: .01,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}

Widget profileText(detail, content, bool isShort) {

  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference user = FirebaseFirestore.instance.collection('Users');
  DocumentReference docRef = user.doc(auth.currentUser?.uid);

  return Padding(
    padding: const EdgeInsets.only(left: 35),
    child: Row(
      children: [
        SizedBox(
            width: isShort ? width * .31 : width * .21,
            child: Text(
              detail,
              style: GoogleFonts.roboto(
                  color: theme, fontSize: 20, fontWeight: FontWeight.bold),
            )),
        SizedBox(
            width: isShort ? width * .35 : width * .46,
            child: StreamBuilder<DocumentSnapshot>(
          stream: docRef.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Error...');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading...');
            }
            if (!snapshot.hasData) {
              return const Text('No Data found');
            }
            DocumentSnapshot docSnapshot = snapshot.data!;
            String fieldData = (docSnapshot.get(content)).toString();
            editData[content] = fieldData;
            editData['id']=docSnapshot.id;

            return Text(fieldData,style: GoogleFonts.roboto(
                fontSize: 19, fontWeight: FontWeight.bold, height: 1.6));
          },
        )),
      ],
    ),
  );
}