import 'package:flutter/material.dart';

class Headers extends StatelessWidget {
  const Headers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Machine name',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text('Kg'),
        Text('sets'),
        Text('repeats'),
      ],
    );
  }
}
