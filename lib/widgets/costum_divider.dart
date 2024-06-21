import 'package:flutter/material.dart';
import 'package:smartprint/shared/theme.dart';

class CostumDivider extends StatelessWidget {
  const CostumDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(
          color: greyDarkColor,
        ),
        Center(
            child: Container(
                height: 20,
                width: 80,
                color: Colors.white,
                child: Center(
                    child: Text(
                  "Atau",
                  style:
                      blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ))))
      ],
    );
  }
}
