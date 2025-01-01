import 'package:flutter/material.dart';

import '../shared/theme.dart';

class KategoriCard extends StatelessWidget {
  final image;
  final title;
  const KategoriCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 32),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 48,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
