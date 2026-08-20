import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/features/onboarding/screens/theme_screen.dart';
import 'package:todoapp/features/onboarding/widgets/navigation_button_widget.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

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
                    SizedBox(height: 66),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: SvgPicture.asset(
                        "assets/images/svg/welcome2.svg",
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(height: 100),
                    SizedBox(
                      width: double.infinity,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: 'Stay'),
                            TextSpan(
                              text: ' organized,\n',
                              style: TextStyle(color: Color.fromARGB(255, 227, 145, 57)),
                            ),
                            TextSpan(text: 'anywhere.'),
                          ],
                        ),
                      ),
                    ),

                    // //
                    SizedBox(height: 12),
                    //
                    SizedBox(
                      width: double.infinity,
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          "Transform scattered thoughts\ninto actionable plans that actually get done",
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Column(
                children: [
                  //
                  const SizedBox(height: 25),
                  NavigationButtonWidget(page: ThemeScreen(), text: 'Next'),

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
