import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/features/onboarding/screens/name_screen.dart';
import 'package:todoapp/shared/widgets/color_picker_widget.dart';
import 'package:todoapp/features/onboarding/widgets/navigation_button_widget.dart';
import 'package:todoapp/core/data/user_data.dart';
import 'package:todoapp/shared/widgets/theme_toggle_widget.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 60),

                    ValueListenableBuilder(
                      valueListenable: selectedColor,
                      builder: (context, value, child) {
                        return Blob.fromID(
                          id: ['7-9-980'],
                          size: 300, // Bigger blob size
                          styles: BlobStyles(color: selectedColor.value),
                          child: Center(
                            child: Lottie.asset(
                              width: 200,
                              height: 200,
                              'assets/lotties/rainbowcat.json',
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 20),
                    ColorPickerWidget(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Text('Select your theme', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  ThemeToggleWidget(),
                  SizedBox(height: 25),
                  NavigationButtonWidget(
                    page: InputNameScreeen(),
                    text: 'Done!',
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
