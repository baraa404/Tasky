import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todoapp/core/data/user_data.dart';
import 'package:todoapp/features/home/screens/homepage.dart';
import 'package:todoapp/shared/widgets/avatar_selector_widget.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    ValueListenableBuilder(
                      valueListenable: userName,
                      builder: (context, value, child) {
                        return Text(
                          "Last step, $value!",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Choose your avatar",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    //
                    SizedBox(height: 12),
                    AvatarSelectorWidget(background: true),
                  ],
                ),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size(165, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {
                  appState.onboardingDone.value = true;
                  Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: HomePage(),
                      duration: Duration(milliseconds: 500),
                    ),
                    (route) => false,
                  );
                },
                child: Text(
                  'Get Started!🎉',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
