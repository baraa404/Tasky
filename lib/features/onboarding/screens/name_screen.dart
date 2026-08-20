import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todoapp/core/data/user_data.dart';
import 'package:todoapp/features/onboarding/screens/avatar_screen.dart';

class InputNameScreeen extends StatefulWidget {
  InputNameScreeen({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  State<InputNameScreeen> createState() => _InputNameScreeenState();
}

class _InputNameScreeenState extends State<InputNameScreeen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    // Create controller and sync with ValueNotifier
    nameController = TextEditingController(text: userName.value);

    // Listen for changes from the controller and update the ValueNotifier
    nameController.addListener(() {
      userName.value = nameController.text.isEmpty
          ? ''
          : nameController.text[0].toUpperCase() + nameController.text.substring(1);
      //capitalize the first letter of the name
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: widget.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                //
                //
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "What's your name",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      //
                      SizedBox(height: 20),
                      //
                      TextFormField(
                        controller: nameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (value.length >= 10) {
                            return 'Name must be less than 10 characters';
                          }
                          return null;
                        },
                      ), //
                    ],
                  ),
                ),

                //
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(165, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () async {
                    if (widget.formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus(); // Dismiss the keyboard
                      Future.delayed(Duration(milliseconds: 400), () {
                        // Navigate to the Avatar page after a delay
                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: AvatarScreen(),
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                      });
                    }
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
