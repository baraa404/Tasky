import 'package:flutter/material.dart';
import 'package:todoapp/core/data/user_data.dart';
import 'package:todoapp/features/home/screens/homepage.dart';
import 'package:todoapp/features/onboarding/screens/welcome_screen1.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color?>(
      valueListenable: selectedColor,
      builder: (context, color, child) {
        return ValueListenableBuilder<bool>(
          valueListenable: isDarkModeNotifier,
          builder: (context, isDarkMode, child) {
            return MaterialApp(
              theme: ThemeData(
                fontFamily: 'Poppins',
                colorScheme: ColorScheme.fromSeed(
                  seedColor: color ?? const Color(0xFFff8796),
                  brightness: isDarkMode ? Brightness.dark : Brightness.light,
                ),
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
              home: appState.onboardingDone.value
                  ? const HomePage()
                  : const WelcomeScreen1(),
            );
          },
        );
      },
    );
  }
}
