import 'package:flutter/material.dart';

class AddMachine extends StatefulWidget {
  @override
  AddMachineState createState() {
    return AddMachineState();
  }
}

class AddMachineState extends State<AddMachine> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Column(children: <Widget>[
        Column(
          children: <Widget>[
            Center(
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Form(
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
                            hintText: 'How many sets?',
                            labelText: 'Sets *',
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
                            icon: Icon(Icons.person),
                            hintText: 'How many repeats?',
                            labelText: 'Repeats *',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            print(value);
                            return null;
                          },
                        )
                      ],
                    )))),
          ],
        ),
        Text('Create Your new Machine Here'),
        Center(
            child: RaisedButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              print(_formKey.currentState);
            }
            // Navigator.pop(context);
          },
          child: Text('Submit'),
        )),
      ]),
    );
  }
}
