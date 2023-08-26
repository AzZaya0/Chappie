import 'package:chappie/WIdgets/constants.dart';
import 'package:chappie/models/usermodel.dart';

class UserRepo {
  static UserModel? me;
  // store Current user info on me
  static Future<void> userInfo() async {
    return await Constants.firestore
        .collection('users')
        .doc(Constants.cuser.email)
        .get()
        .then((user) async {
      if (user.exists) {
        me = UserModel.fromJson(user.data()!);
        print(me?.display_name.toString());
      } else {
        await createusers().then((value) => userInfo());
      }
    });
  }

//<--------------------------------------------------------->\\
//check if the user exists
  static Future<bool> userexist() async {
    return (await Constants.firestore
            .collection('users')
            .doc(Constants.cuser.email)
            .get())
        .exists;
  }

// for creating a new user
  static Future<void> createusers() async {
    final Newuser = UserModel(
        email: Constants.cuser.email.toString(),
        photo: Constants.cuser.photoURL.toString() ?? '',
        username: Constants.cuser.email.toString().split('@')[0],
        display_name: Constants.cuser.displayName.toString() ?? '');

    return await Constants.firestore
        .collection('users')
        .doc(Constants.auth.currentUser!.email)
        .set(Newuser
            .toJson()); //tojeson came from usermodel which converts dart to json
  }
}
