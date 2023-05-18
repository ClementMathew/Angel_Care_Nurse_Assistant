import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/provider.dart';
import 'Welcome Screens/WelcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TagProvider(),
    child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nurse App',
        home: WelcomePage()));
  }
}