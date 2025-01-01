import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartprint/pages/detail_produk.dart';
import '../models/produk_model.dart';
import '../shared/theme.dart';

class ProdukCard extends StatelessWidget {
  final List<ProdukModel> jenisProduk;


    ProdukCard({super.key, required this.jenisProduk});

    final formatRupiah = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 14),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Jumlah kolom
        mainAxisSpacing: 16, // Spasi antar baris
        crossAxisSpacing: 16, // Spasi antar kolom
        childAspectRatio: 156 / 182, // Proporsi lebar/tinggi setiap item
      ),
      itemCount: jenisProduk.length,
      shrinkWrap:
          true, // Mengatur ukuran grid agar tidak mengganggu widget di atas atau di bawahnya
      physics:
          const NeverScrollableScrollPhysics(), // Menonaktifkan scrolling internal

      itemBuilder: (context, index) {
        final  product = jenisProduk[index];

        return GestureDetector(
          onTap: () {
            
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProduk(produk: product),));
          },
          child: Container(
            width: 156,
            height: 200,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(product),
                const SizedBox(height: 9),
                _buildInfo(product),
              ],
            ),
          ),
        );
      },
    );
  }

  // Method untuk membangun tampilan gambar produk
  Widget _buildImage(ProdukModel product) {
    return Container(
      height: 112,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(product.image),
        ),
      ),
    );
  }

  // Method untuk membangun informasi produk
  Widget _buildInfo(ProdukModel product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 8),
          Text(
           formatRupiah.format(product.price),
            style: blueTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 12),
          _buildRatingAndSold(product),
        ],
      ),
    );
  }

  // Method untuk membangun tampilan rating dan jumlah produk yang terjual
  Widget _buildRatingAndSold(ProdukModel product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          size: 18,
          color: Colors.yellow,
        ),
        const SizedBox(width: 3),
        Text(
          "${product.rating}",
          style: blackTextStyle.copyWith(fontSize: 10),
        ),
        const Spacer(),
        _buildSoldBadge(product),
      ],
    );
  }

  // Method untuk membangun badge jumlah produk yang terjual
  Widget _buildSoldBadge(ProdukModel product) {
    return Container(
      width: 55,
      height: 13,
      color: soldColor,
      child: Center(
        child: Text(
          "${product.sold} Sold",
          style: blueTextStyle.copyWith(fontSize: 8),
        ),
      ),
    );
  }
}
