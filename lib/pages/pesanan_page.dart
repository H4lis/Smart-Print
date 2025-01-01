import 'package:flutter/material.dart';
import 'package:smartprint/data/pesanan_source.dart';
import '../shared/theme.dart';
import '../widgets/pesanan_tracking_navigation.dart';
import '../widgets/produk_tracking_card.dart';
import 'tracking_produk_page.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({super.key});

  @override
  _PesananPageState createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  int selectedIndex = 0;

  Widget buildPesananList() {
    return Column(
      children: pesananData[selectedIndex]
          .map((pesanan) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrackingProdukPage(),
                        ));
                  },
                  child: ProdukTrackingCard(
                    image: pesanan['image']!,
                    title: pesanan['title']!,
                  ),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Text(
          "Order",
          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 26,
            ),
            Text(
              "Pesanan Saya",
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
            ),
            SizedBox(
              height: 26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: PesananTrackingNavigation(
                    title: "Belum Bayar",
                    status: selectedIndex == 0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: PesananTrackingNavigation(
                    title: "Proses",
                    status: selectedIndex == 1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  child: PesananTrackingNavigation(
                    title: "Selesai",
                    status: selectedIndex == 2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            // Konten dinamis berdasarkan status yang dipilih
            Expanded(
              child: SingleChildScrollView(
                child: buildPesananList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
