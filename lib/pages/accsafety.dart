// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sabi/pages/auth_controllers/db_provider.dart';

class AccSafety extends StatefulWidget {
  const AccSafety({super.key});

  @override
  State<AccSafety> createState() => _AccSafetyState();
}

class _AccSafetyState extends State<AccSafety> {
  bool val1 = false;
  bool val2 = false;
  bool _secured = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DbProvider().getAuthState().then((value) {
      setState(() {
        val2 = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account safety",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Easy controls to manage your account",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            ListTile(
              title: Text(
                "Two-layer protection",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              trailing: Switch(
                activeColor: Colors.white,
                activeTrackColor: Color(0xff695CFE),
                inactiveThumbColor: Colors.white,
                value: _secured,
                onChanged: (value) {
                  setState(() {
                    _secured = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
            ListTile(
              title: Text(
                "Finger print",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              subtitle: const Text('Enable fingerprint!'),
              trailing: Switch(
                activeColor: Colors.white,
                activeTrackColor: Color(0xff695CFE),
                inactiveThumbColor: Colors.white,
                value: val2,
                onChanged: (value) {
                  setState(() {
                    val2 = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
