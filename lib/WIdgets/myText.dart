// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  String text;
  Color? color;
  double? fontsize;
  FontWeight? fontWeight;

  MyText({
    Key? key,
    required this.text,
    required this.color,
    required this.fontsize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
    
      text,
      style:
          TextStyle(color: color, fontSize: fontsize, fontWeight: fontWeight),
    );
  }
}
