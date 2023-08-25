// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chappie/WIdgets/constants.dart';
import 'package:chappie/WIdgets/myText.dart';

class NoInternetPage extends StatelessWidget {
  NoInternetPage({
    Key? key,
    required this.text,
    this.ontap,
  }) : super(key: key);
  final String text;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
//--------------------------- Provider & MediaQuary -----------------------------\\
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
                    text: 'No Internet ',
                    color: kTextColor,
                    fontWeight: FontWeight.bold,
                    fontsize: screenWidth * 0.1),
              ),
              Image.asset(
                // <------------------ Image "Robot Image"----------------------
                'lib/assets/No InternetImg.png',
                height: screenHeight * 0.5,
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Center(
                child: GestureDetector(
                  // <---------------- Button "Google Login Button"-------------
                  onTap: ontap,
                  child: Container(
                    height: screenHeight * 0.085,
                    width: screenWidth * 0.85,
                    decoration: BoxDecoration(
                        border: Border.all(color: kTextColor),
                        borderRadius: BorderRadius.circular(14)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          width: screenWidth * 0.05,
                        ),
                        MyText(
                            text: text,
                            color: kTextColor,
                            fontsize: screenWidth * 0.05)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  // <------------------ Text  'or'-------------------------------
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.02, bottom: screenHeight * 0.02),
                  child: Center(
                    child: MyText(
                        text: "Waiting For Internet connection.",
                        color: kSubColor,
                        fontsize: screenWidth * 0.04),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
