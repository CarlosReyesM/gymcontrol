import 'package:flutter/material.dart';

class AddMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Column(children: <Widget>[
        Text('Create Your new Machine Here'),
        Center(
            child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        )),
      ]),
    );
  }
}
