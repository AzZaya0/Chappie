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
//--------------------------- Provider & MediaQuary -----------------------------\\
    final provider = Provider.of<WelcomePageProvider>(context, listen: false);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
//-------------------------------------------------------------------------------\\
//--------------------------------- Main ---------------------------------------\\

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlackColor,
        body: MarginContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                //-------------------- Text "Welcome To chappie"----------------
                padding: EdgeInsets.only(bottom: screenWidth * 0.1),
                child: MyText(
                    text: 'Welcome to\nChappie',
                    color: kTextColor,
                    fontWeight: FontWeight.bold,
                    fontsize: screenWidth * 0.1),
              ),
              Image.asset(
                // <------------------ Image "Robot Image"----------------------
                'lib/assets/cutie.png',
                height: screenHeight * 0.5,
              ),
              Center(
                child: GestureDetector(
                  // <---------------- Button "Google Login Button"-------------
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
                // <------------------ Text  'or'-------------------------------
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
                  //<----------------- Button "To Login Page"-------------------
                  ontap: () {
                    provider.navigateTo(context);
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
