import 'package:barber_booking_app/ui/screens/login_screen.dart';
import 'package:barber_booking_app/ui/widgets/screens_bg.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreensBG(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                          color: Color.fromARGB(199, 255, 255, 255),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Abu Zafor",
                        style: TextStyle(
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
                      child: Image.asset(
                        "images/boy.jpg",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Divider(color: Colors.white38,),
              SizedBox(height: 15,),
              Text(
                "Services",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  ServicesCard(imagePath: "images/shaving.png",title: "Classical Shaving",),
                  const SizedBox(width: 20,),
                  ServicesCard(imagePath: "images/hair.png",title: "Hair Washing",),
                ],
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  ServicesCard(imagePath: "images/cutting.png",title: "Hair Cutting",),
                  const SizedBox(width: 20,),
                  ServicesCard(imagePath: "images/beard.png",title: "Beard Trimming",),
                ],
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  ServicesCard(imagePath: "images/facials.png",title: "Facials",),
                  const SizedBox(width: 20,),
                  ServicesCard(imagePath: "images/kids.png",title: "Kids Hair Cutting",),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void onClickOnProfileIcon(){
    Navigator.pushNamed(context, LoginScreen.name);
  }
}


