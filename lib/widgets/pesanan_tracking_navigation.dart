import 'package:flutter/material.dart';

import '../shared/theme.dart';

class PesananTrackingNavigation extends StatelessWidget {
  final String title;
  final bool status;
  const PesananTrackingNavigation(
      {super.key, required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 28,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: primaryColor),
          color: status ? primaryColor : whiteColor,
          borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            color: status ? whiteColor : primaryColor,
            fontSize: 10,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
