// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sabi/pages/about.dart';
import 'package:sabi/pages/home.dart';
import 'package:sabi/pages/option.dart';
import 'package:sabi/pages/privacy.dart';
import 'package:sabi/pages/termscon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  toggleDrawer() async {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List _pages = [
      Home(),
      Option(),
      OnBoardingScreen(),
      PrivacyPolicy(),
      TermsCon(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: _pages[_selectedIndex],
      drawer: Drawer(
        backgroundColor: Color(0xff695CFE),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
          child: ListView(
            children: [
              ListTile(
                title: Text("Home",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                    toggleDrawer();
                  });
                },
              ),
              ListTile(
                title: Text("Option",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                    toggleDrawer();
                  });
                },
              ),
              ListTile(
                title: Text("About us",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    )),
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                    toggleDrawer();
                  });
                },
              ),
              ListTile(
                title: Text("Privacy policy",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                    toggleDrawer();
                  });
                },
              ),
              ListTile(
                title: Text("Terms & Conditions",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                onTap: () {
                  setState(() {
                    _selectedIndex = 4;
                    toggleDrawer();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
