import 'package:barber_booking_app/ui/screens/home_screen.dart';
import 'package:barber_booking_app/ui/widgets/screens_bg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                GestureDetector(
                  onTap: _onTapOnButton,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFdf711a),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Get A Stylish Haircut",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
  void _onTapOnButton(){
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.name, (predicate)=>false);
  }
}
