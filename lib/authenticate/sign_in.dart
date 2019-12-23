import 'package:flutter/material.dart';
import 'package:gymcontrol/services/auth.dart'; 

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthServide _auth = AuthServide();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
        title: Text('Sign in to Gym Control'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Center(
          child: RaisedButton(
            child: Text('Sign in anonusmally'),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print('Error sign in');
              } else {
                print('Signed in');
                print(result);
              }
            },
          ),
        ),
      ),
    );
  }
}