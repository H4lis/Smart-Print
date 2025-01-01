import 'package:flutter/material.dart';

import '../shared/theme.dart';

class TrackingProdukCard extends StatelessWidget {
  final String image;
  final String title;
  const TrackingProdukCard(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 96,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            width: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
                Text(
                  "Rp30.000",
                  style: blueTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Merah | Kertas A4 | 24 pcs",
                  style: blackTextStyle.copyWith(
                    fontSize: 8,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 13,
                      color: yellowColor,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "4.6",
                      style: blackTextStyle.copyWith(fontSize: 10),
                    ),
                    Spacer(),
                    Container(
                      width: 100,
                      height: 13,
                      color: soldColor,
                      child: Center(
                        child: Text(
                          "Dalam Pengiriman",
                          style: blueTextStyle.copyWith(fontSize: 8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
