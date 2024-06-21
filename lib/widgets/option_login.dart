import 'package:flutter/material.dart';

class OptionLogin extends StatelessWidget {
  const OptionLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/icon_facebook.png",
              height: 32,
            )),
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/icon_google.png",
              height: 32,
            )),
      ],
    );
  }
}
