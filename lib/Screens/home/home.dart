// ignore_for_file: sort_child_properties_last

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
    final user = FirebaseAuth.instance.currentUser!;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: AppBar(
        backgroundColor: kBlackColor,
        elevation: 0,
      ),
      drawer: SafeArea(
          child: Drawer(
        child: ListView(
          children: [
            ListTile(
              focusColor: kSubColor,
              onTap: () {},
              title: Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: screenWidth * 0.03),
                      decoration: BoxDecoration(
                          color: kTextColor,
                          borderRadius: BorderRadius.circular(200)),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(400),
                          child: Image.network(
                            user.photoURL.toString(),
                            height: screenHeight * 0.10,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                            text: 'Ayush Gautam',
                            color: kTextColor,
                            fontsize: 22),
                        MyText(
                            text: 'ayush2020', color: kSubColor, fontsize: 18)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        width: screenWidth * 0.7,
        backgroundColor: kDrawer,
      )),
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
            child: MyText(text: 'Sign Out', color: kTextColor, fontsize: 20),
          ),
        ),
      ),
    );
  }
}
