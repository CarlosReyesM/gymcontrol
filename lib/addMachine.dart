import 'package:flutter/material.dart';

class AddMachine extends StatefulWidget {
  @override
  AddMachineState createState() {
    return AddMachineState();
  }
}

bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
  final num value = num.tryParse(s);
  final bool isValid = value != null && value > 0;
  return isValid;
}

class AddMachineState extends State<AddMachine> {
  final _formKey = GlobalKey<FormState>();
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
                      icon: Icon(Icons.toll),
                      hintText: 'What is the machine name?',
                      labelText: 'Name *',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      print(value);
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.toll),
                      hintText: 'How many kilos?',
                      labelText: 'Kilos *',
                    ),
                    validator: (value) {
                      if (!isNumeric(value)) {
                        return 'Please enter some number';
                      }
                      print(isNumeric(value));
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.toll),
                      hintText: 'How many sets?',
                      labelText: 'Sets *',
                    ),
                    validator: (value) {
                      if (!isNumeric(value)) {
                        return 'Please enter some number';
                      }
                      print(value);
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'How many repeats?',
                      labelText: 'Repeats *',
                    ),
                    validator: (value) {
                      if (!isNumeric(value)) {
                        return 'Please enter some number';
                      }
                      print(value);
                      return null;
                    },
                  )
                ],
              )),
          Center(child: Text('Create Your new Machine Here')),
          Center(
              child: RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                print(_formKey.currentState);
              }
              // Navigator.pop(context);
            },
            child: Text('Submit'),
          ))
        ]));
  }
}
