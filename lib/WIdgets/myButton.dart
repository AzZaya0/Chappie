import 'package:flutter/material.dart';

import 'constants.dart';
import 'myText.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
//hahahahahahaha