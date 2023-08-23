// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'constants.dart';
import 'myText.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {Key? key,
      required this.screenWidth,
      required this.screenHeight,
      required this.ontap})
      : super(key: key);

  final double screenWidth;
  final double screenHeight;
  void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: screenWidth * 0.88,
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
            color: kButtonColor, borderRadius: BorderRadius.circular(14)),
        child: MyText(
            text: 'Login',
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontsize: screenWidth * 0.09),
      ),
    );
  }
}
