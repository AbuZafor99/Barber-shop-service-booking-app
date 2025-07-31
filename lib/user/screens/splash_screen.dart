import 'dart:math' as math;

import 'package:barber_booking_app/user/screens/signup_screen.dart';
import 'package:barber_booking_app/user/screens/home_screen.dart';
import 'package:barber_booking_app/user/screens/onbording_screen.dart';
import 'package:barber_booking_app/user/services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/screens_bg.dart';
import 'onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    _screenReplacement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreensBG(
        child: Center(
          child: Text(
            "Barber\n Shop",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _screenReplacement() async {
    // Check if user is already logged in
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // User is logged in, check if we have user data in shared preferences
      String? userName = await SharedPreferenceHelper().getUserName();

      if (userName != null && userName.isNotEmpty) {
        // User data exists, go directly to home screen
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.name,
          (predicate) => false,
        );
      } else {
        // User is logged in but no data in shared preferences, go to onboarding
        Navigator.pushNamedAndRemoveUntil(
          context,
          OnbordingScreen.name,
          (predicate) => false,
        );
      }
    } else {
      // No user logged in, go to onboarding
      Navigator.pushNamedAndRemoveUntil(
        context,
        OnbordingScreen.name,
        (predicate) => false,
      );
    }
  }
}
