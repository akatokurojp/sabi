// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
import 'package:sabi/drawer.dart';
import 'package:sabi/pages/SignUp-SignIn-Forgot/forgot.dart';
import 'package:sabi/pages/SignUp-SignIn-Forgot/register_page.dart';

import '../auth_controllers/auth_controllers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Here's your first step",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "with us!",
                  style: TextStyle(fontSize: 20),
                ),

                SizedBox(
                  height: 40,
                ),

                //email
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                    child: TextField(
                      controller: authController.loginEmailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //password
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                    child: TextField(
                      obscureText: true,
                      controller: authController.loginPasswordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgorPage()));
                        }),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                //or
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              thickness: 2,
                            ))),
                    Text(
                      "or",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: Divider(
                              color: Colors.black,
                              thickness: 2,
                            ))),
                  ],
                ),

                SizedBox(
                  height: 80,
                ),

                //sign with google
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("lib/assets/icons/google.png"),
                          height: 30,
                          width: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            "Continue with Google",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 80,
                ),

                //button sign in
                GestureDetector(
                  onTap: () {
                    authController.loginUser();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff695CFE),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                            child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                      )),
                ),

                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I don't have an account yet?",
                        style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        "Sign up",
                        style:
                            TextStyle(fontSize: 17, color: Color(0xff695CFE)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
