import 'package:barber_booking_app/user/screens/home_screen.dart';
import 'package:barber_booking_app/user/screens/login_screen.dart';
import 'package:barber_booking_app/user/widgets/screens_bg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/main_button.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  static const String name='/onbording-screen';

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreensBG(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Image(image: AssetImage("images/barber.png")),
                ),
                const SizedBox(height: 50,),
                MainButton(title: "Let's get started",onClick: _onTapOnButton),
              ],
            ),
      ),
    );
  }
  void _onTapOnButton(){
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.name, (predicate)=>false);
  }
}


