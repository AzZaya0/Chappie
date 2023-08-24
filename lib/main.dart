// ignore_for_file: prefer_const_constructors

import 'package:chappie/Provider/authentications/authPage.dart';
import 'package:chappie/Provider/loginPageProvider.dart';
import 'package:chappie/Provider/signupPageProvider.dart';
import 'package:chappie/Provider/welcomePageProvider.dart';

import 'package:chappie/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WelcomePageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpPageProvider(),
        )
      ],
      child: MaterialApp(
        home: AuthPage(),
        debugShowCheckedModeBanner: false,
      )));
}
