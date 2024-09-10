import 'package:calculator_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSevice {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference userCollect =
      FirebaseFirestore.instance.collection('users');

  Future<UserCredential> registerUser(UserModel user) async {
    UserCredential userData = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: user.email.toString(), password: user.password.toString());

    if (user.email != null) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(userData.user!.uid)
          .set({
        'uid': userData.user!.uid,
        'email': userData.user!.email,
        'createdAt': user.createdAt,
        'status': user.status
      });
    }
    return userData;
  }

  Future<DocumentSnapshot?> loginUser(UserModel user) async {
    DocumentSnapshot? snapshot;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    UserCredential userData = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: user.email.toString(), password: user.password.toString());
    String? token = await userData.user!.getIdToken();
    if (userData.user != null) {
      snapshot = await userCollect.doc(userData.user!.uid).get();
      await sharedPreferences.setString('token', token!);
      await sharedPreferences.setString('email', snapshot['email']);
    }
    return snapshot;
  }

  Future<void> logout() async {
    SharedPreferences shapre = await SharedPreferences.getInstance();
    await shapre.clear();
    await auth.signOut();
  }

  Future<bool> islogedin() async {
    SharedPreferences shapre = await SharedPreferences.getInstance();
    String? token = await shapre.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
