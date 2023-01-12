// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sabi/pages/SignUp-SignIn-Forgot/login_page.dart';

import '../auth_controllers/auth_controllers.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //sign up
                Text(
                  "Sign up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter information to create your",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "account",
                  style: TextStyle(fontSize: 20),
                ),

                SizedBox(
                  height: 40,
                ),

                //textfield username
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      child: TextField(
                        controller: authController.emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your Email"),
                      ),
                    )),

                SizedBox(
                  height: 10,
                ),

                //textfielf email
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      child: TextField(
                        obscureText: true,
                        controller: authController.passwordController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your Password"),
                      ),
                    )),

                SizedBox(
                  height: 10,
                ),

                //textfield password
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                      child: TextField(
                        obscureText: true,
                        controller: authController.confirmpasswordController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your Password again"),
                      ),
                    )),

                SizedBox(
                  height: 220,
                ),

                //button sign up
                GestureDetector(
                  onTap: () {
                    authController.createAccount();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff695CFE),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                            child: Text(
                          "Sign up",
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

                //already have and account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an accont?",
                        style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Sign in",
                        style:
                            TextStyle(fontSize: 17, color: Color(0xff695CFE)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
