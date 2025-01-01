import 'package:flutter/material.dart';
import 'package:smartprint/shared/theme.dart';

class PromoCard extends StatelessWidget {
  final String image;
  const PromoCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, top: 28, bottom: 20),
      height: 128,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
