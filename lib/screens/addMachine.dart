import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class AddMachine extends StatefulWidget {
  @override
  AddMachineState createState() {
    return AddMachineState();
  }
}

_down(String name, int kilos, int sets, int repeats) {
  var uuid = Uuid();
  var idString = uuid.toString();
  Firestore.instance.collection('machines').add(
    {"name": name, "kg": kilos, "repeats": repeats, "sets": sets}
  );
}

bool _isNumeric(String s) {
  if (s == null) {
    return false;
  }
  final num value = num.tryParse(s);
  final bool isValid = value != null && value > 0;
  return isValid;
}

class AddMachineState extends State<AddMachine> {
  final _formKey = GlobalKey<FormState>();
  String name, kilos, sets, repeats;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: ListView(padding: EdgeInsets.all(18.0), children: <Widget>[
          Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.arrow_forward),
                        hintText: 'What is the machine name?',
                        labelText: 'Name *',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        name = value;
                      }),
                  TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.arrow_forward),
                        hintText: 'How many kilos?',
                        labelText: 'Kilos *',
                      ),
                      validator: (value) {
                        if (!_isNumeric(value)) {
                          return 'Please enter some number';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        kilos = value;
                      }),
                  TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.arrow_forward),
                        hintText: 'How many sets?',
                        labelText: 'Sets *',
                      ),
                      validator: (value) {
                        if (!_isNumeric(value)) {
                          return 'Please enter some number';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        sets = value;
                      }),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.arrow_forward),
                      hintText: 'How many repeats?',
                      labelText: 'Repeats *',
                    ),
                    validator: (value) {
                      if (!_isNumeric(value)) {
                        return 'Please enter some number';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      repeats = value;
                    },
                  )
                ],
              )),
          Center(child: Text('Create Your new Machine Here')),
          Center(
              child: RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print(_formKey.currentState);
                print([name, kilos, sets, repeats]);
                _down(name, int.parse(kilos), int.parse(sets),
                    int.parse(repeats));
              }
              Navigator.pop(context);
            },
            child: Text('Submit'),
          ))
        ]));
  }
}
