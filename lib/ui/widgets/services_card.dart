import 'package:barber_booking_app/ui/screens/booking_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({
    super.key, required this.imagePath, required this.title,
  });

  final String imagePath;
  final String title;
  // final VoidCallbackAction onClick;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap:(){
          Navigator.pushNamed(context, BookingScreen.name);
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: Color(0xFFe29452),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath,height: 80,width: 80,),
              const SizedBox(height: 10,),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}