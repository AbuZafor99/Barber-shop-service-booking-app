import 'package:barber_booking_app/admin/screens/admin_dashboard_screen.dart';
import 'package:barber_booking_app/admin/screens/admin_login_screen.dart';
import 'package:barber_booking_app/user/screens/home_screen.dart';
import 'package:barber_booking_app/user/screens/login_screen.dart';
import 'package:barber_booking_app/user/screens/onbording_screen.dart';
import 'package:barber_booking_app/user/screens/signup_screen.dart';
import 'package:barber_booking_app/user/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
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
        SplashScreen.name: (context) => SplashScreen(),
        OnbordingScreen.name: (context) => OnbordingScreen(),
        HomeScreen.name: (context) => HomeScreen(),
        LoginScreen.name: (context) => LoginScreen(),
        SignUpScreen.name: (context) => SignUpScreen(),
        AdminLoginScreen.name: (context) => AdminLoginScreen(),
        AdminDashboardScreen.name: (context) => AdminDashboardScreen(),
      },
    );
  }
}
