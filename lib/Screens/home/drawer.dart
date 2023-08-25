// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chappie/WIdgets/constants.dart';
import 'package:chappie/WIdgets/myText.dart';

class MyDetails extends StatelessWidget {
  final String image;
  double screenHeight;
  double screenWidth;
  MyDetails({
    Key? key,
    required this.image,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusColor: kSubColor,
      onTap: () {},
      title: Container(
        child: Row(
          children: [
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(text: 'Ayush Gautam', color: kTextColor, fontsize: 22),
                MyText(text: 'ayush2020', color: kSubColor, fontsize: 18)
              ],
            )
          ],
        ),
      ),
    );
  }
}
