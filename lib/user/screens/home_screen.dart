import 'package:barber_booking_app/user/screens/login_screen.dart';
import 'package:barber_booking_app/user/services/shared_pref.dart';
import 'package:barber_booking_app/user/widgets/screens_bg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/services_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? name, image;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      name = await SharedPreferenceHelper().getUserName();
      image = await SharedPreferenceHelper().getUserImage();
    } catch (e) {
      // Set default values if there's an error
      name = "Guest";
      image =
          "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: ScreensBG(
        child: Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello",
                        style: TextStyle(
                          color: Color.fromARGB(199, 255, 255, 255),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        name ?? "Guest",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: onClickOnProfileIcon,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        image ??
                            "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Divider(color: Colors.white38),
              const SizedBox(height: 15),
              const Text(
                "Services",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              const Row(
                children: [
                  ServicesCard(
                    imagePath: "images/shaving.png",
                    title: "Classical Shaving",
                  ),
                  SizedBox(width: 20),
                  ServicesCard(
                    imagePath: "images/hair.png",
                    title: "Hair Washing",
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Row(
                children: [
                  ServicesCard(
                    imagePath: "images/cutting.png",
                    title: "Hair Cutting",
                  ),
                  SizedBox(width: 20),
                  ServicesCard(
                    imagePath: "images/beard.png",
                    title: "Beard Trimming",
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Row(
                children: [
                  ServicesCard(
                    imagePath: "images/facials.png",
                    title: "Facials",
                  ),
                  SizedBox(width: 20),
                  ServicesCard(
                    imagePath: "images/kids.png",
                    title: "Kids Hair Cutting",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClickOnProfileIcon() {
    _showLogoutDialog();
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _logout();
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _logout() async {
    try {
      // Sign out from Firebase Auth
      await FirebaseAuth.instance.signOut();

      // Clear all data from Shared Preferences
      await SharedPreferenceHelper().clearAllData();

      // Navigate to login screen and clear all previous routes
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen.name,
        (predicate) => false,
      );
    } catch (e) {
      print('Error during logout: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during logout. Please try again.')),
      );
    }
  }
}
