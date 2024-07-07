import 'package:commerce/pages/authenticate.dart';
import 'package:commerce/pages/homescreen_one.dart';
import 'package:get/get.dart';
import 'package:commerce/models/user_model.dart';
import 'package:commerce/try.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class SplashScreen extends StatefulWidget {

  final Username? user;

  const SplashScreen({required this.user, super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: Image.asset('assets/gif2.gif'),
        ),
        nextScreen: NewScreen(),
      splashIconSize: 600,
      backgroundColor: Colors.white,
    );
  }
}
