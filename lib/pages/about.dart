// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sabi/drawer.dart';
import 'package:sabi/pages/about_us%20pages/intro_page_4.dart';
import 'package:sabi/pages/about_us%20pages/intro_page_5.dart';
import 'package:sabi/pages/about_us%20pages/intro_page_6.dart';
import 'package:sabi/pages/about_us%20pages/intro_page_7.dart';
import 'package:sabi/pages/about_us%20pages/intro_page_8.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'about_us pages/intro_page_1.dart';
import 'about_us pages/intro_page_2.dart';
import 'about_us pages/intro_page_3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 7);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
              IntroPage5(),
              IntroPage6(),
              IntroPage7(),
              IntroPage8(),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(8);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff695CFE)),
                    ),
                  ),
                  //dot indicator
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 8,
                    effect: WormEffect(
                      dotHeight: 7,
                      dotWidth: 7,
                      activeDotColor: Color(0xff695CFE),
                    ),
                  ),
                  //next or done
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff695CFE)),
                          ))
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff695CFE)),
                          )),
                ],
              )),
        ],
      ),
    );
  }
}
