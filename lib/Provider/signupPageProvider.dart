import 'package:chappie/Provider/authentications/authPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../WIdgets/myText.dart';

class SignUpPageProvider with ChangeNotifier {
  final _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final _passController = TextEditingController();
  TextEditingController get passController => _passController;

  final _confirmPass = TextEditingController();
  TextEditingController get confirmPass => _confirmPass;

  void signUp(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passController.text);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AuthPage()));
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
                fontsize: 24,
                color: Colors.white,
              ),
            ),
          );
        });
  }
}
