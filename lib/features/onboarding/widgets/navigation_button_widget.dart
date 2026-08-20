import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NavigationButtonWidget extends StatelessWidget {
  const NavigationButtonWidget({super.key, required this.page, required this.text});

  final Widget page;
  final String text;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: Size(165, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: page,
            duration: Duration(milliseconds: 500),
          ),
        );
      },
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    );
  }
}
