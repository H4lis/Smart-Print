import 'package:flutter/material.dart';
import '../shared/theme.dart';

class ProdukTrackingCard extends StatelessWidget {
  final String image;
  final String title;

  const ProdukTrackingCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildImage(),
          const SizedBox(width: 12),
          _buildInfo(),
        ],
      ),
    );
  }

  // Method untuk membangun tampilan gambar produk
  Widget _buildImage() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Method untuk membangun informasi produk
  Widget _buildInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
          Text(
            "Rp30.000",
            style: blueTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "Merah | Kertas A4 | 24 pcs",
            style: blackTextStyle.copyWith(
              fontSize: 8,
            ),
          ),
          const SizedBox(height: 2),
          _buildRatingAndStatus(),
        ],
      ),
    );
  }

  // Method untuk membangun tampilan rating dan status produk
  Widget _buildRatingAndStatus() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 13,
          color: Colors.yellow,
        ),
        const SizedBox(width: 3),
        Text(
          "4.6",
          style: blackTextStyle.copyWith(fontSize: 10),
        ),
        const Spacer(),
        _buildStatusBadge(),
      ],
    );
  }

  // Method untuk membangun badge status pengiriman
  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: soldColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          "Dalam Pengiriman",
          style: blueTextStyle.copyWith(fontSize: 8),
        ),
      ),
    );
  }
}
