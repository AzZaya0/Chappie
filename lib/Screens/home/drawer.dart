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
            Container(
              margin: EdgeInsets.only(right: screenWidth * 0.03),
              decoration: BoxDecoration(
                  color: kTextColor, borderRadius: BorderRadius.circular(200)),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(400),
                  child: Image.network(
                    image,
                    height: screenHeight * 0.10,
                  ),
                ),
              ),
            ),
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
