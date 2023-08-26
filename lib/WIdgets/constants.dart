// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Color kMainColor = Color();
Color kBlackColor = Colors.black;
Color kSubColor = Color(0xffd4d4d4);
Color kTextColor = Color(0xffffffff);
Color kDrawer = Color(0xff222222);
Color kButtonColor = Color(0xff41ead4);

class MarginContainer extends StatelessWidget {
  Widget child;
  MarginContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        left: screenWidth * 0.04,
        right: screenWidth * 0.04,
        top: screenHeight * 0.03,
      ),
      child: child,
    );
  }
}

//global constaints
class Constants {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  //get the current user
  static User get cuser => auth.currentUser!;
}
