// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'constants.dart';
class MyTextField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  Widget? suffixIcon;
  MyTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.04, right: screenWidth * 0.04),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: kTextColor),
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            focusColor: kButtonColor,
            hintText: hintText,
            hintStyle: TextStyle(color: kTextColor),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: kTextColor,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kTextColor,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(14),
            )),
      ),
    );
  }
}
