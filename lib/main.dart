import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecredit/bindings/all_bindings.dart';
import 'package:wecredit/view/splash_screen.dart';

void main() {
  AllBindings().initializeBindings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:  SplashScreen(),
      theme: ThemeData(
        fontFamily: "Manrope",
        useMaterial3: false
      ),
    );
  }
}


