import 'package:flutter/material.dart';

import '../shared/theme.dart';

class TrackingProdukPage extends StatelessWidget {
  const TrackingProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Gantungan Kunci",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardExpedisi(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "21 Nov",
                        style: greyDarkTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        "10:00 ",
                        style: greyDarkTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 17, left: 17),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tiba di Tujuan",
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 10),
                    ),
                    Text(
                      "Pesanan Anda telah diantarkan, Diterima oleh : Asrul Halis",
                      style: greyDarkTextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget cardExpedisi() {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          color: whiteColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 14,
        ),
        margin: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Diterima Sel, 21 Nov 2023",
              style: blueTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 14,
              ),
            ),
            const Divider(),
            Row(
              children: [
                Container(
                  width: 19,
                  height: 14,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/elon.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "JNE Express",
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  "K0D392300239",
                  style: greyDarkTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.content_copy_outlined,
                  color: blackColor,
                  size: 14,
                ),
              ],
            ),
          ],
        ));
  }
}
