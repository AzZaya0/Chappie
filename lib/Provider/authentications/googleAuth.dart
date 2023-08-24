import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignin {
  Future signinWithGoogle() async {
    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();

    try {
      if (guser != null) {
        final GoogleSignInAuthentication gauth = await guser!.authentication;

        final credential = GoogleAuthProvider.credential(
            accessToken: gauth.accessToken, idToken: gauth.idToken);

        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
