import 'dart:math' as math;

import 'package:barber_booking_app/ui/screens/signup_screen.dart';
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

  void _screenReplacement() {
    Navigator.pushNamedAndRemoveUntil(context, SignUpScreen.name, (predicate)=>false);
  }
}


