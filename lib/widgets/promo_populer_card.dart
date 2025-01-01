import 'package:flutter/material.dart';
import 'package:smartprint/shared/theme.dart';

import '../models/promo_model.dart';

class PromoPupulerCard extends StatelessWidget {
  const PromoPupulerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 14, right: defaultMargin),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          promoPopuler.length,
          (i) => Container(
            margin: EdgeInsets.only(left: defaultMargin),
            height: 128,
            width: 323,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(promoPopuler[i].image),
                )),
          ),
        ),
      ),
    );
  }
}
