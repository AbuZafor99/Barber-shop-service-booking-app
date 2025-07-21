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
                Color(0xFF2b1615),
                Color(0xFF2b1615),
                Color(0xFF2b1615)
              ],
              transform: GradientRotation(math.pi / 3),
            ),
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
