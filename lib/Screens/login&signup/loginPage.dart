// ignore_for_file: prefer_const_constructors

import 'package:chappie/WIdgets/constants.dart';
import 'package:chappie/WIdgets/myText.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: MarginContainer(
          child: Column(
            children: [
              MyText(
                text: 'Login to\nyour account',
                color: kTextColor,
                fontsize: 40,
              ),
              Image.asset(
                'lib/assets/loginCutie.png',
                height: screenHeight * 0.45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
