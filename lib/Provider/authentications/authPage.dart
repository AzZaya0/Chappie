import 'package:chappie/Screens/login&signup/welcomePage.dart';
import 'package:chappie/Screens/noInternetPage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Screens/home/home.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    Connectivitycheck();
  }

  dynamic result1;

  Future<void> Connectivitycheck() async {
    var result = await Connectivity().checkConnectivity();
    setState(() {
      result1 = result;
    });
    print(result1);
  }

  @override
  Widget build(BuildContext context) {
    return result1 != ConnectivityResult.none
        ? Scaffold(
            body: StreamBuilder<ConnectivityResult>(
                stream: Connectivity().onConnectivityChanged,
                builder: (context, snapshot) {
                  if (snapshot.data != ConnectivityResult.none) {
                    return StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.authStateChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return HomePage();
                          } else {
                            return WelcomePage();
                          }
                        });
                  } else {
                    return NoInternetPage(
                      text: 'Checking your Internet',
                    );
                  }
                }),
          )
        : NoInternetPage(
            text: 'Tap to Refresh.',
            ontap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return AuthPage();
              }));
            },
          );
  }
}
