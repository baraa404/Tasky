import 'package:flutter/material.dart';
import 'package:todoapp/core/data/user_data.dart';

class ThemeToggleWidget extends StatefulWidget {
  const ThemeToggleWidget({super.key});

  @override
  State<ThemeToggleWidget> createState() => _ThemeToggleWidgetState();
}

class _ThemeToggleWidgetState extends State<ThemeToggleWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return Transform.scale(
          scale: 1.5, // Make the switch bigger
          child: Switch(
            value: isDarkMode,
            activeColor: Colors.white, // Icon color when active
            activeTrackColor: Colors.grey[800], // Dark track color
            inactiveThumbColor: Colors.white, // Icon color when inactive
            inactiveTrackColor: Colors.grey[300], // Light track color
            thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
              if (states.contains(WidgetState.selected)) {
                return Icon(
                  Icons.dark_mode,
                  color: Colors.grey[800], // Dark icon on white thumb
                  size: 16,
                );
              }
              return Icon(
                Icons.light_mode,
                color: Colors.orange, // Light icon on white thumb
                size: 16,
              );
            }),
            onChanged: (value) {
              isDarkModeNotifier.value = value; // Update the ValueNotifier
            },
          ),
        );
      },
    );
  }
}
