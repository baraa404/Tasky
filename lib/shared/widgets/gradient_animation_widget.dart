import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

class GradientAnimationWidget extends StatelessWidget {
  const GradientAnimationWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      animateAlignments: true,
      duration: Duration(seconds: 4),
      primaryColors: const [
        Color(0xFFFCE4EC), // Light pink
        Color(0xFFF8BBD0), // Soft pink
        Color(0xFFFFF9C4), // Light yellow
      ],
      secondaryColors: const [
        Color(0xFFFFF176), // Soft yellow
        Color(0xFFFFE082), // Light yellow
        Color(0xFFF48FB1), // Medium pink
      ],
      child: child,
    );
  }
}
