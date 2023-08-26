import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class GetUser extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser!;
  Stream<QuerySnapshot> getallUser() {
    return FirebaseFirestore.instance
        .collection('users')
        .where('email', isNotEqualTo: user.email)
        .snapshots();
  }
}
