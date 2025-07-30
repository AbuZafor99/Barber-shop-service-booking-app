import 'package:barber_booking_app/ui/screens/booking_screen.dart';
import 'package:barber_booking_app/ui/screens/home_screen.dart';
import 'package:barber_booking_app/ui/screens/login_screen.dart';
import 'package:barber_booking_app/ui/screens/onbording_screen.dart';
import 'package:barber_booking_app/ui/screens/signup_screen.dart';
import 'package:barber_booking_app/ui/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        SplashScreen.name:(context)=>SplashScreen(),
        OnbordingScreen.name:(context)=>OnbordingScreen(),
        HomeScreen.name:(context)=>HomeScreen(),
        // BookingScreen.name:(context)=>BookingScreen(service: '',),
        LoginScreen.name:(context) =>LoginScreen(),
        SignUpScreen.name:(context) =>SignUpScreen(),
      },
    );
  }
}
