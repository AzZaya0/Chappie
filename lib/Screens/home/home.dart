// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_print

import 'package:chappie/Database/userRepo.dart';
import 'package:chappie/WIdgets/constants.dart';

import 'package:chappie/WIdgets/myText.dart';
import 'package:chappie/Database/allUsers.dart';
import 'package:chappie/models/usermodel.dart';
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
  List<UserModel> userdatalist = [];
  @override
  void initState() {
    super.initState();
    UserRepo.userInfo();
  }

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
                      UserRepo.me?.photo ?? '',
                      height: screenHeight * 0.07,
                    ),
                  ),
                ),
              ),
              MyText(
                  text: UserRepo.me?.display_name ?? '',
                  color: kTextColor,
                  fontsize: 28),
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
              if (snapshot.hasData) {
                final data = snapshot.data?.docs;
                userdatalist = data
                        ?.map((e) => UserModel.fromJson(
                            e.data() as Map<String, dynamic>))
                        .toList() ??
                    [];
                //userdatalist containts instance of model
                return ListView.builder(
                    itemCount: userdatalist.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              child: ClipRRect(
                                child:
                                    Image.network((userdatalist[index]).photo),
                              ),
                            ),
                            Column(
                              children: [
                                MyText(
                                    text: (userdatalist[index]).display_name,
                                    color: Colors.white,
                                    fontsize: 20)
                              ],
                            )
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
