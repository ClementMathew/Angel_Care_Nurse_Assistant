import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nurse_assistant/Nurse/profileEditPage.dart';
import 'package:nurse_assistant/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'Provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) async {
    await Firebase.initializeApp();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TagProvider(),
        child: MaterialApp(
            routes: {'/edit': (context) => const ProfileEditPage()},
            debugShowCheckedModeBanner: false,
            title: 'Nurse App',
            home: const SplashScreen()));
  }
}