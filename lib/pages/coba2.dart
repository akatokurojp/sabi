import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TestTemp2 extends StatefulWidget {
  @override
  _TestTemp2State createState() => _TestTemp2State();
}

class _TestTemp2State extends State<TestTemp2> {
  double _temperature = 0;
  bool _ledStatus = false;
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    databaseReference.child("temp").onValue.listen((event) {
      setState(() {
        _temperature = double.parse(event.snapshot.value.toString());
      });
    });

    databaseReference.child("LED_STATUS").onValue.listen((event) {
      setState(() {
        _ledStatus = event.snapshot.value == "ON" ? true : false;
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
            Switch(
              value: _ledStatus,
              onChanged: (value) {
                setState(() {
                  _ledStatus = value;
                  databaseReference
                      .child("led_status")
                      .set(value ? "ON" : "OFF");
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
