import 'package:flutter/material.dart';
import './buildMachineLinst.dart';
import './addMachine.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
