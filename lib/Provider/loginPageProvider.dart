import 'package:chappie/Screens/login&signup/signupPage.dart';
import 'package:flutter/material.dart';

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
}
