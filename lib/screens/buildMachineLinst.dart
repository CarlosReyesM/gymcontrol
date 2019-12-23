import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuildMachineList extends StatelessWidget {
  const BuildMachineList({Key key}) : super(key: key);
  down(String field, Object reference, int amount) {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(reference);
      await transaction.get(reference);
      await transaction
          .update(freshSnap.reference, {field: freshSnap[field] - amount});
    });
  }

  up(String field, Object reference, int amount) {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(reference);
      await transaction.get(reference);
      await transaction
          .update(freshSnap.reference, {field: freshSnap[field] + amount});
    });
  }

  Widget _buildMachineList(BuildContext context, DocumentSnapshot document) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Machine name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    document['name'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Text('Kg'),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                  ),
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 25.0, 10.0),
                  margin: EdgeInsets.fromLTRB(5, 5, 10, 0),
                  child: Text(document['kg'].toString()),
                ),
              ],
            ),
            onLongPress: () => down('kg', document.reference, 5),
            onTap: () => up('kg', document.reference, 5),
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Text('sets'),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                  ),
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 25.0, 10.0),
                  margin: EdgeInsets.fromLTRB(5, 5, 10, 0),
                  child: Text(document['sets'].toString()),
                ),
              ],
            ),
            onLongPress: () => down('sets', document.reference, 1),
            onTap: () => up('sets', document.reference, 1),
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Text('repeats'),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                  ),
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 25.0, 10.0),
                  margin: EdgeInsets.fromLTRB(5, 5, 10, 0),
                  child: Text(document['repeats'].toString()),
                ),
              ],
            ),
            onLongPress: () => down('repeats', document.reference, 1),
            onTap: () => up('repeats', document.reference, 1),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('machines').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('loading...');
          return ListView.builder(
              itemExtent: 80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildMachineList(context, snapshot.data.documents[index]));
        });
  }
}
