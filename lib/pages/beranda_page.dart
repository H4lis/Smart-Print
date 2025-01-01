import 'package:flutter/material.dart';
import 'package:smartprint/widgets/kategori_card.dart';
import 'package:smartprint/widgets/produk_card.dart';

import '../models/produk_model.dart';
import '../shared/theme.dart';
import '../widgets/promo_populer_card.dart';
import '../widgets/promo_card.dart';
import '../widgets/title_text.dart';
import '../widgets/toko_card.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Container(
          margin: const EdgeInsets.only(top: 10),
          height: 38,
          child: TextField(
            style: blackTextStyle.copyWith(fontSize: 12),
            decoration: InputDecoration(
              fillColor: greyLightColor,
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: ImageIcon(
                  const AssetImage("assets/images/search.png"),
                  color: blackColor,
                ),
              ),
              hintText: "Search",
              hintStyle: greyTextStyle.copyWith(fontSize: 12),
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: greyColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: greyColor, // Warna border saat TextField enabled
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PromoPupulerCard(),
            kategori(),
            produkPopular(),
            promo2(),
            tokoTerdekat(),
            promo3(),
            produkLainnya(),
            lihatLebihBanyak(),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  Widget kategori() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 26,
        ),
        const TitleText(
          title: "Kategori",
        ),
        const SizedBox(
          height: 24,
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(left: defaultMargin),
          scrollDirection: Axis.horizontal,
          child: const Row(
            children: [
              KategoriCard(
                image: "assets/images/Banner.png",
                title: "Banner",
              ),
              KategoriCard(
                image: "assets/images/Kaos.png",
                title: "Kaos",
              ),
              KategoriCard(
                image: "assets/images/Tumbler.png",
                title: "Tumbler",
              ),
              KategoriCard(
                image: "assets/images/Plakat.png",
                title: "Plakat",
              ),
              KategoriCard(
                image: "assets/images/Ganci.png",
                title: "Ganci",
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget produkPopular() {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TitleText(
              title: "Produk Populer",
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: defaultMargin),
                child: Text("See All",
                    style: blueTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 14,
                        decoration: TextDecoration.underline)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        ProdukCard(
          jenisProduk: produkPopuler,
        )
      ],
    );
  }

  Widget promo2() {
    return PromoCard(
      image: "assets/images/promo2.png",
    );
  }

  Widget tokoTerdekat() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TitleText(
              title: "Toko Terdekat",
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: defaultMargin),
                child: Text("See All",
                    style: blueTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 14,
                        decoration: TextDecoration.underline)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        TokoCard()
      ],
    );
  }

  Widget promo3() {
    return PromoCard(
      image: "assets/images/promo3.png",
    );
  }

  Widget produkLainnya() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TitleText(
              title: "Produk Lainnya",
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: defaultMargin),
                child: Text("See All",
                    style: blueTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 14,
                        decoration: TextDecoration.underline)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        ProdukCard(
          jenisProduk: produkLainnyaa,
        )
      ],
    );
  }

  Widget lihatLebihBanyak() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 24),
      child: Container(
        width: double.infinity,
        height: 42,
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 1),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "Lihat lebih banyak",
            style: blueTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          ),
        ),
      ),
    );
  }
}
