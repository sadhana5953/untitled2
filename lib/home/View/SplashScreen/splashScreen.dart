import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled2/home/View/HomeScreen/homePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Get.to(Homepage());
    });
    return Scaffold(
      backgroundColor: Color(0xff474747),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   height: 170,
          //   width: 170,
          //   margin: EdgeInsets.only(left: 70),
          //   decoration: BoxDecoration(
          //     image: DecorationImage(image: AssetImage('assets/images/news.png'),fit: BoxFit.cover),
          //   ),
          // ),
          Container(
            height: 80,
            width: 335,
            margin: EdgeInsets.only(left: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://1000logos.net/wp-content/uploads/2020/10/Sky-News-Logo.png'),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
