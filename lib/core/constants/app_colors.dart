import 'package:flutter/material.dart';

// This file contains all color constants used throughout the app
// Include theme colors, primary/secondary colors, custom colors, etc.
// Keep all color definitions centralized here for easy maintenance

class AppColors {
  // Available theme colors for user selection
  static const List<Color> availableThemeColors = [
    Color(0xFFff8796), // Default pink
    Color(0xFF6200EE), // Purple
    Color(0xFF03DAC6), // Teal
    Color(0xFF4CAF50), // Green
    Color(0xFFFF9800), // Orange
    Color(0xFFE91E63), // Pink
    Color(0xFF2196F3), // Blue
    Color(0xFF9C27B0), // Deep Purple
  ];

  // Default theme color (fallback)
  static const Color defaultThemeColor = Color(0xFFff8796);
  // Status colors (always fixed)
  static const Color errorColor = Color(0xFFB00020);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);
}
