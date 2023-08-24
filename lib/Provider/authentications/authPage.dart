import 'package:chappie/Screens/login&signup/welcomePage.dart';
import 'package:chappie/Screens/noInternetPage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Screens/home/home.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

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
  void Connectivitycheck() async {
    var result = await Connectivity().checkConnectivity();
    print(result.name);
    setState(() {
      result1 = result.name;
      print(result1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return result1 != 'none'
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
                      text: 'Waiting For Internet connection.',
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
