// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:chappie/Provider/loginPageProvider.dart';
import 'package:chappie/WIdgets/myButton.dart';
import 'package:chappie/WIdgets/myTextField.dart';
import 'package:flutter/material.dart';

import 'package:chappie/WIdgets/constants.dart';
import 'package:chappie/WIdgets/myText.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final _loginProviderr =
        Provider.of<LoginPageProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlackColor,
        body: SingleChildScrollView(
          child: MarginContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: 'Login to\nyour account',
                  color: kTextColor,
                  fontsize: screenWidth * 0.1,
                ),
                Center(
                  child: Image.asset(
                    'lib/assets/loginCutie.png',
                    height: screenHeight * 0.38,
                  ),
                ),
                MyTextField(
                  controller: _loginProviderr.emailController,
                  hintText: 'Enter your email',
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                MyTextField(
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: kTextColor,
                    ),
                    hintText: 'Enter your password',
                    controller: _loginProviderr.passController),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Center(
                  child: MyButton(
                      screenWidth: screenWidth * 0.95,
                      screenHeight: screenHeight * 1,
                      ontap: () {
                        _loginProviderr.SignIn(context);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.03, bottom: screenHeight * 0.03),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _loginProviderr.googleLogin(context);
                      },
                      child: Image.asset(
                        'lib/assets/google.png',
                        height: screenHeight * 0.06,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                        text: 'don\'t have an account?',
                        color: kTextColor,
                        fontsize: 20),
                    GestureDetector(
                        onTap: () {
                          _loginProviderr.signup(context);
                        },
                        child: MyText(
                            text: 'Signup', color: kButtonColor, fontsize: 20)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
