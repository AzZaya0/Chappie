import 'package:cloud_firestore/cloud_firestore.dart';

class SignupModel {
  final String email;
  final String photo;
  final String username;

  SignupModel({
    required this.photo,
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toSignup() {
    return {
      'email': email,
      'photo': photo,
      'username': username,
    };
  }
}
