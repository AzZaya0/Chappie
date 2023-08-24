import 'package:chappie/Screens/login&signup/loginPage.dart';
import 'package:flutter/material.dart';

import 'authentications/googleAuth.dart';

class WelcomePageProvider with ChangeNotifier {
  void navigateTo(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
  }

  void googleSignIn(context) {
    GoogleSignin().signinWithGoogle();
  }
}
