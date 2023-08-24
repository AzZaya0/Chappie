import 'package:flutter/material.dart';

class SignUpPageProvider with ChangeNotifier {
  final _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final _passController = TextEditingController();
  TextEditingController get passController => _passController;

  final _confirmPass = TextEditingController();
  TextEditingController get confirmPass => _confirmPass;
}
