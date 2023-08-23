import 'package:chappie/Screens/login&signup/welcomePage.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
