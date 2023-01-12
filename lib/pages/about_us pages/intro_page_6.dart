// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
import 'package:lottie/lottie.dart';

class IntroPage6 extends StatelessWidget {
  const IntroPage6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("lib/assets/icons/tn.ahonk.png"),
                  height: 350,
                  width: 350,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aulia',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Fathurohman',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Back-End Web Dev',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff695CFE)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Student from Bandung National Institute of Technology majoring in Informatics Engineering. Coreldraw and Adobe Xd expert. Understand the Python, Java, and SQL/MySQL very well. looking to become a Game Developer',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
