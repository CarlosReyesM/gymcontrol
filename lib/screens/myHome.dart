import 'package:flutter/material.dart';
import 'package:gymcontrol/services/auth.dart';
import './buildMachineLinst.dart';
import './addMachine.dart';

class MyHomePage extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My machines'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: BuildMachineList(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Center(
              child: RaisedButton(
                color: Colors.blueGrey[200],
                child: Text('Sign Out'),
                onPressed: () async {
                  dynamic result = await _auth.signOut();
                  if (result == null) {
                    print('Error sign in');
                  }
                },
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMachine()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
