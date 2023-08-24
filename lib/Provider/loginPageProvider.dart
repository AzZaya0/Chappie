// ignore_for_file: prefer_const_constructors

import 'package:chappie/Provider/authentications/googleAuth.dart';
import 'package:chappie/Screens/login&signup/signupPage.dart';
import 'package:chappie/WIdgets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../WIdgets/myText.dart';

class LoginPageProvider with ChangeNotifier {
  // variables
  final _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final _passController = TextEditingController();
  TextEditingController get passController => _passController;

  // obsecure texts

  //function

  void signup(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SignupPage();
    }));
  }

  void googleLogin(context) {
    GoogleSignin().signinWithGoogle().then((value) => Navigator.pop(context));
  }

  void SignIn(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passController.text);

      Navigator.pop(context);
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);

      showerror(e.code, context);
    }
  }

  void showerror(String message, context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            insetAnimationDuration: const Duration(milliseconds: 200),
            title: Center(
              child: MyText(
                text: message,
                fontsize: 23,
                color: kTextColor,
              ),
            ),
          );
        });
  }
}
