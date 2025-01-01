import 'package:flutter/material.dart';

import '../models/photo_produk_koment_model.dart';

class PhotoKoment extends StatelessWidget {
  const PhotoKoment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
          children: List.generate(
        photoKoment.length,
        (i) => Container(
          margin: EdgeInsets.only(right: 8),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(photoKoment[i].image),
            ),
          ),
        ),
      )),
    );
  }
}
