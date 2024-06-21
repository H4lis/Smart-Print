import 'package:flutter/material.dart';

class Splashpage extends StatelessWidget {
  const Splashpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/Logo.png",
              width: 293,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 24.0), // Add padding if needed
              child: Image.asset(
                "assets/images/copyright.png",
                width: 74,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
