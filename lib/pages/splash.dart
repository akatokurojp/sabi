import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sabi/main.dart';
import 'package:sabi/pages/SignUp-SignIn-Forgot/login_page.dart';
import 'package:sabi/pages/auth_controllers/db_provider.dart';
import 'package:sabi/pages/auth_controllers/screen_lock_provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      DbProvider().getAuthState().then((value) {
        if (value == false) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const LoginPage())));
        } else {
          ScreenLock(ctx: context).authenticateUser(path: 'splash');
        }
      });
    });
    return const Scaffold(
        body: Center(
      child: Text('welcome'),
    ));
  }
}
