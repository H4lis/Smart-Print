import 'package:flutter/material.dart';

import '../shared/theme.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String icon;

  const ProfileCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Row(
        children: [
          ImageIcon(
            AssetImage(
              icon,
            ),
            color: blackColor,
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
          ),
        ],
      ),
    );
  }
}
