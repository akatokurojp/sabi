// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabi/pages/SignUp-SignIn-Forgot/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sabi/pages/coba.dart';
import 'package:sabi/pages/coba2.dart';
import 'package:sabi/pages/db_chart.dart';
import 'package:sabi/pages/home.dart';
import 'package:sabi/pages/splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
