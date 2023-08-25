// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:chappie/WIdgets/constants.dart';

import 'package:chappie/WIdgets/myText.dart';
import 'package:chappie/repo/allUsers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          toolbarHeight: screenHeight * 0.1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kTextColor,
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(400),
                    child: Image.network(
                      user.photoURL!,
                      height: screenHeight * 0.07,
                    ),
                  ),
                ),
              ),
              MyText(text: user.displayName!, color: kTextColor, fontsize: 28),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  GoogleSignIn().signOut();
                },
                child: Icon(
                  Icons.logout,
                  size: 40,
                ),
              )
            ],
          ),
          backgroundColor: kBlackColor,
          elevation: 0,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: GetUser().getallUser(),
            builder: (
              context,
              snapshot,
            ) {
              final userSnapshot = snapshot.data?.docs;
              // Map<String, dynamic> data =
              //     userSnapshot.data() as Map<String, dynamic>;
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: userSnapshot!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              child: ClipRRect(
                                child: Image.network(
                                    userSnapshot[index]['photo'].toString()),
                              ),
                            ),
                            Column()
                          ],
                        ),
                      );
                    });
              }
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              return Container(
                child: MyText(
                    text: 'loading.....', color: kTextColor, fontsize: 20),
              );
            }));
  }
}
