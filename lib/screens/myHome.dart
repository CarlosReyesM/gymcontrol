import 'package:flutter/material.dart';
import './buildMachineLinst.dart';
import './addMachine.dart';

class MyHomePage extends StatelessWidget {

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