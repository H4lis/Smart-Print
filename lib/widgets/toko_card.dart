import 'package:flutter/material.dart';

import '../models/toko_model.card.dart';
import '../shared/theme.dart';

class TokoCard extends StatelessWidget {
  const TokoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        tokoTerdekat.length,
        (i) => Container(
          margin: EdgeInsets.only(right: defaultMargin),
          height: 114,
          width: 300,
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
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                height: 114,
                width: 118,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(tokoTerdekat[i].image))),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: 157,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tokoTerdekat[i].name,
                      style: blackTextStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    ),
                    Text(
                      tokoTerdekat[i].description,
                      maxLines: 2,
                      style: blueTextStyle.copyWith(
                          fontSize: 8, fontWeight: medium),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: yellowColor,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${tokoTerdekat[i].rating}",
                          style: blackTextStyle.copyWith(fontSize: 10),
                        ),
                        Spacer(),
                        Container(
                          width: 55,
                          height: 13,
                          color: soldColor,
                          child: Center(
                            child: Text(
                              "${tokoTerdekat[i].sold}",
                              style: blueTextStyle.copyWith(fontSize: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageIcon(
                          AssetImage(
                            "assets/images/icon_lokasi.png",
                          ),
                          color: primaryColor,
                          size: 20,
                        ),
                        Container(
                          width: 135,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: tokoTerdekat[i].alamat,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 6,
                                      fontWeight: medium // Teks bold
                                      ),
                                ),
                                TextSpan(
                                  text: tokoTerdekat[i].alamatDetail,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 6,
                                    fontWeight: light, // Teks biasa
                                  ),
                                ),
                              ],
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
        ),
      )),
    );
  }
}
