import 'package:flutter/material.dart';
import 'package:todoapp/core/data/user_data.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedColor,
      builder: (context, value, child) {
        // container with background color and shadow
        return Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(200, 55)),
            color: value,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 23, right: 25, top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Productivity Boost text
                Text(
                  'Productivity Boost',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(220, 255, 255, 255),
                  ),
                ),

                /// User greeting text
                ValueListenableBuilder(
                  valueListenable: userName,
                  builder: (context, value, child) {
                    return Text.rich(
                      TextSpan(
                        style: TextStyle(fontSize: 30),
                        children: [
                          TextSpan(
                            text: 'Hello, $value👋🏻\nHow ready are you\nto tackle ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.values[4], // Using a bold weight
                            ),
                          ),
                          TextSpan(
                            text: 'your\ntasks today?',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
