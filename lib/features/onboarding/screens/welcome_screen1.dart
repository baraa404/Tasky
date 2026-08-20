import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
// ignore: unused_import
import 'package:todoapp/features/onboarding/screens/welcome_screen2.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});

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

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: SvgPicture.asset(
                          "assets/images/svg/welcome1.svg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(height: 100),
                    //
                    SizedBox(
                      width: double.infinity,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(text: 'Welcome to your\n'),
                            TextSpan(
                              text: 'productivity',
                              style: TextStyle(color: Color(0xFFff8796)),
                            ),
                            TextSpan(text: ' booster.'),
                          ],
                        ),
                      ),
                    ),
                    //
                    SizedBox(height: 12),
                    //
                    SizedBox(
                      width: double.infinity,
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          "Organize your tasks and boost your\nproductivity with our simple, to-do app.",
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
                  // NavigationButtonWidget(page: WelcomeScreen2(), text: 'Next'),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      minimumSize: Size(165, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          //@audit navigate shortcut
                          child: WelcomeScreen2(),
                          // child: HomePage(),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
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
