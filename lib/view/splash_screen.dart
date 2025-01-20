import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wecredit/constants/color_constants.dart';
import 'package:wecredit/controllers/splash_screen_controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {

  final SplashController splashController = Get.find();

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        color: whiteColor,
        child: Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 130,
              height: 40,
            ),
        ),
      ),
    );
  }
}
