import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class TestTemp extends StatefulWidget {
  @override
  _TestTempState createState() => _TestTempState();
}

class _TestTempState extends State<TestTemp> {
  double _temperature = 0;
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    super.initState();
    databaseReference.child("temp").onValue.listen((event) {
      setState(() {
        _temperature = double.parse(event.snapshot.value.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${_temperature.toString()}°",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
