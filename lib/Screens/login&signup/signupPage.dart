import 'package:chappie/Provider/signupPageProvider.dart';
import 'package:chappie/WIdgets/constants.dart';
import 'package:chappie/WIdgets/myButton.dart';
import 'package:chappie/WIdgets/myText.dart';
import 'package:chappie/WIdgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final _signupProvider =
        Provider.of<SignUpPageProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlackColor,
        body: SingleChildScrollView(
          child: MarginContainer(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                  text: 'Create\nyour account',
                  color: kTextColor,
                  fontsize: screenWidth * 0.1),
              Center(
                child: Image.asset(
                  'lib/assets/signupCutie.png',
                  height: screenHeight * 0.34,
                ),
              ),
              MyTextField(
                  hintText: 'Email',
                  controller: _signupProvider.emailController),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              MyTextField(
                  hintText: 'Password',
                  controller: _signupProvider.passController),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              MyTextField(
                  hintText: 'Confirm Password',
                  controller: _signupProvider.confirmPass),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              Center(
                child: MyButton(
                    screenWidth: screenWidth * 0.95,
                    screenHeight: screenHeight * 1,
                    ontap: () {
                      _signupProvider.signUp(context);
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.02, bottom: screenHeight * 0.012),
                child: Center(
                  child: MyText(
                    text: 'or',
                    color: Colors.grey.shade500,
                    fontsize: 22,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                  child: GestureDetector(
                    onTap: () {
                      _signupProvider.googleLogin(context);
                    },
                    child: Image.asset(
                      'lib/assets/google.png',
                      height: screenHeight * 0.05,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
