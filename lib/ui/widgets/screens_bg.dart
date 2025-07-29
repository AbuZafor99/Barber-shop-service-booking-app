import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreensBG extends StatelessWidget {
  const ScreensBG({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFb91635),
                Color(0xFF621d3c),
                Color(0xFF311937)
              ],
              transform: GradientRotation(math.pi / 20),
            ),
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
