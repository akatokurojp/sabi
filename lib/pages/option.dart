// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sabi/pages/SignUp-SignIn-Forgot/login_page.dart';
import 'package:sabi/pages/accsafety.dart';
import 'package:sabi/pages/language.dart';

class Option extends StatefulWidget {
  const Option({super.key});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "Connected",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your device is connected",
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
              Image(
                image: AssetImage("lib/assets/icons/ac_on.png"),
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: 150,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Language()));
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xff695CFE)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                          child: Text(
                        "Change language",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff695CFE)),
                      )),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccSafety()));
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xff695CFE)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                          child: Text(
                        "Account safety",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff695CFE)),
                      )),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xff695CFE)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                          child: Text(
                        "Log out",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff695CFE)),
                      )),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
