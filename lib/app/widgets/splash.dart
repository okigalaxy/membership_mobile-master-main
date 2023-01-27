import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Image.asset(
          "assets/images/splash.png",
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
