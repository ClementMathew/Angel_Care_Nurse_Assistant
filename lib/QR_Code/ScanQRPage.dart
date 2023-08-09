import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nurse_assistant/Colors/Colors.dart';
import 'package:nurse_assistant/Welcome%20Screens/WelcomePage.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../Nurse/PatientPage.dart';
import '../Provider/provider.dart';

class ScanQRPage extends StatefulWidget {
  final user;
  const ScanQRPage({Key? key, this.user}) : super(key: key);

  @override
  State<ScanQRPage> createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {

  int isEmpty = 0;

  CollectionReference patient =
      FirebaseFirestore.instance.collection('Patients');

  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(
            bottom: 80,
            child: buildResult(),
          ),
          Positioned(top: 70, child: buildControlButtons())
        ],
      ),
    ));
  }

  Widget buildControlButtons() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () async {
                await controller?.toggleFlash();
                setState(() {});
              },
              color: Colors.white,
              icon: FutureBuilder<bool?>(
                future: controller?.getFlashStatus(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Icon(
                        snapshot.data! ? Icons.flash_on : Icons.flash_off);
                  } else {
                    return Container();
                  }
                },
              )),
          IconButton(
              onPressed: () async {
                await controller?.flipCamera();
                setState(() {});
              },
              color: Colors.white,
              icon: FutureBuilder(
                future: controller?.getCameraInfo(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return const Icon(Icons.switch_camera);
                  } else {
                    return Container();
                  }
                },
              ))
        ],
      );

  Widget buildResult() => Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Text(
        barcode != null ? (isEmpty>0 ?'Done !' : 'Loading !') : 'Scan a code !',
        maxLines: 3,
      ));

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            cutOutSize: width * .8,
            borderWidth: 10,
            borderLength: 20,
            borderRadius: 10,
            borderColor: theme),
      );

  void onQRViewCreated(QRViewController controller) {
    var tagprovider = Provider.of<TagProvider>(context, listen: false);

    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
        callData();
        if(isEmpty >0){
          Future.delayed(const Duration(milliseconds: 200), () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientPage(
                      name: tagprovider.getName,
                      age: tagprovider.getAge,
                      date: tagprovider.getDate,
                      disease: tagprovider.getDisease,
                      phone: tagprovider.getPhone,
                      imagelink: tagprovider.getImageLink,
                      user: widget.user),
                ));
          });
        }
      });
    });
  }

  callData() async {
    var tagprovider = Provider.of<TagProvider>(context, listen: false);

    QuerySnapshot snapshot = await patient.where('bed', isEqualTo: barcode!.code).get();
    if (snapshot != null){
      snapshot.docs.forEach((doc) async {
        if(doc['name'] != ""){
          isEmpty = isEmpty+1;
        }
        await tagprovider.giveData(
            doc['name'], doc['age'], doc['admission'], doc['disease'], doc['phone'].toString(),doc['image-link'],doc['symptoms'],doc['medications']);
      });
    } else {
      print('Document does not exist');
    }
  }
}