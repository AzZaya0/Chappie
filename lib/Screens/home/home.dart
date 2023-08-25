import 'package:chappie/Provider/authentications/googleAuth.dart';
import 'package:chappie/WIdgets/constants.dart';
import 'package:chappie/WIdgets/myText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: AppBar(
        backgroundColor: kBlackColor,
        leading: Icon(
          Icons.menu,
          color: kTextColor,
        ),
        elevation: 0,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
            GoogleSignIn().signOut();
          },
          child: Container(
            height: screenHeight * 0.04,
            width: screenWidth * 0.9,
            color: kButtonColor,
            child: MyText(text: 'SignOut', color: kTextColor, fontsize: 20),
          ),
        ),
      ),
    );
  }
}
