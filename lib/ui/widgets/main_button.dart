import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key, required this.title, required this.onClick,this.color
  });

  final String title;
  final VoidCallback onClick;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: color ?? Color(0xFFdf711a),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}