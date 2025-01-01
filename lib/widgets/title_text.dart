import 'package:flutter/material.dart';

import '../shared/theme.dart';

class TitleText extends StatelessWidget {
  final title;
  const TitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: defaultMargin),
      child: Text(
        title,
        style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
      ),
    );
  }
}
