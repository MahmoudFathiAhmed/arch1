import 'dart:async';

import 'package:arch1/core/routes/routes_manager.dart';
import 'package:arch1/core/utils/assets_manager.dart';
import 'package:arch1/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigate to the next page after 3 seconds
      Navigator.pushReplacementNamed(context,
        Routes.startRoute);}
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Center(
        child: Image.asset(ImageAssets.logo),
      ),
    );
  }
}
