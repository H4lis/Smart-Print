import 'package:flutter/material.dart';
import 'package:smartprint/pages/tracking_produk_page.dart';
import 'package:smartprint/widgets/produk_tracking_card.dart';

import '../shared/theme.dart';

class PesananPage2 extends StatefulWidget {
  PesananPage2({super.key});

  @override
  State<PesananPage2> createState() => _PesananPage2State();
}

class _PesananPage2State extends State<PesananPage2> {
  final List<String> tabs = [
    'Belum Bayar',
    'Dalam Proses',
    'Selesai',
  ];

  int _activeTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Text(
          "Pesanan Saya",
          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  tabs.length,
                  (i) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _activeTabIndex = i;
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 28,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: greyColor),
                          color:
                              _activeTabIndex == i ? primaryColor : whiteColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          tabs[i],
                          style: whiteTextStyle.copyWith(
                            color:
                                _activeTabIndex == i ? whiteColor : blackColor,
                            fontSize: 10,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrackingProdukPage()));
                  },
                  child: ProdukTrackingCard(
                      image: "assets/images/ProdukPopuler2.png",
                      title: "Plakat Akrilik"),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
