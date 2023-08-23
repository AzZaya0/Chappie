import 'package:flutter/material.dart';

class LoginPageProvider with ChangeNotifier {
  // variables
  final _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final _passController = TextEditingController();
  TextEditingController get passController => _passController;

  // obsecure texts
}
