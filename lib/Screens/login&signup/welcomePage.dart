// ignore_for_file: prefer_const_constructors

import 'package:chappie/Provider/welcomePageProvider.dart';
import 'package:chappie/WIdgets/constants.dart';
import 'package:chappie/WIdgets/myButton.dart';
import 'package:chappie/WIdgets/myText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomePageProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlackColor,
        body: Container(
          margin: EdgeInsets.only(
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            top: screenHeight * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: screenWidth * 0.1),
                child: MyText(
                    text: 'Welcome to\nChappie',
                    color: kTextColor,
                    fontWeight: FontWeight.bold,
                    fontsize: screenWidth * 0.1),
              ),
              Image.asset(
                'lib/assets/cutie.png',
                height: screenHeight * 0.5,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: screenHeight * 0.085,
                    width: screenWidth * 0.85,
                    decoration: BoxDecoration(
                        border: Border.all(color: kTextColor),
                        borderRadius: BorderRadius.circular(14)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/google.png',
                          height: screenHeight * 0.05,
                        ),
                        SizedBox(
                          width: screenWidth * 0.05,
                        ),
                        MyText(
                            text: 'Continue with Google',
                            color: kTextColor,
                            fontsize: screenWidth * 0.05)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.02, bottom: screenHeight * 0.02),
                child: Center(
                  child: MyText(
                      text: 'or',
                      color: kSubColor,
                      fontsize: screenWidth * 0.08),
                ),
              ),
              Center(
                child: MyButton(
                  ontap: () {
                    provider.navigateto(context);
                  },
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
