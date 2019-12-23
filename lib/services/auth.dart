import 'package:firebase_auth/firebase_auth.dart';

class AuthServide {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // TODO sign in anonimous 
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // TODO sign in with email and password
  // TODO register with email and password 
  // TODO sign out 
}