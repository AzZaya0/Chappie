import 'package:chappie/models/signupModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignupService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //store data

  Future<void> store() async {
    print('repoo');
    final user = _auth.currentUser!;
    SignupModel _newModel = SignupModel(
      photo: user.photoURL!.toString(),
      username: user.email!.split('@')[0].toString(),
      email: user.email!,
    );

    await _firestore
        .collection('users')
        .doc(user.email)
        .set(_newModel.toSignup());
  }
}
