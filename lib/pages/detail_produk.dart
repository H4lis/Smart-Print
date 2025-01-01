// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:smartprint/widgets/toko_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/midtrans_service.dart';
import '../services/transaction_service.dart';
import '../models/produk_model.dart';
import '../models/toko_model.card.dart';
import '../shared/theme.dart';
import '../widgets/payment_screen.dart';
import '../widgets/photo_koment.dart';

class DetailProduk extends StatefulWidget {
  final ProdukModel produk;
  const DetailProduk({
    Key? key,
    required this.produk,
  }) : super(key: key);

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  void _showPaymentMethodPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Dialog bisa ditutup jika klik di luar
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Metode Pembayaran'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("GoPay"),
                  leading: Icon(Icons.payment, color: Colors.green),
                  onTap: () {
                    _processTransaction(context, "gopay");
                  },
                ),
                ListTile(
                  title: Text("Bank Transfer"),
                  leading: Icon(Icons.account_balance, color: Colors.blue),
                  onTap: () {
                    _processTransaction(context, "bank_transfer");
                  },
                ),
                ListTile(
                  title: Text("Credit Card"),
                  leading: Icon(Icons.credit_card, color: Colors.orange),
                  onTap: () {
                    _processTransaction(context, "credit_card");
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _processTransaction(
      BuildContext context, String paymentMethod) async {
    // Menutup dialog setelah memilih metode pembayaran
    Navigator.of(context).pop();

    try {
      final orderId = "order-${DateTime.now().millisecondsSinceEpoch}";

      final transactionDetails = {
        "payment_type": paymentMethod,
        "transaction_details": {
          "order_id": orderId,
          "gross_amount": widget.produk.price,
        },
        "customer_details": {
          "first_name": "NamaDepan",
          "last_name": "NamaBelakang",
          "email": "email@example.com",
          "phone": "081234567890",
        },
      };

      final response =
          await MidtransService.createTransaction(transactionDetails);
      print('Transaksi berhasil: $response');

      // Menangani response dari Midtrans
      if (response['actions'] != null) {
        for (var action in response['actions']) {
          if (action['name'] == 'generate-qr-code' &&
              paymentMethod == "gopay") {
            final qrCodeUrl = action['url'];
            _launchGoPayPayment(qrCodeUrl);
          } else if (action['name'] == 'deeplink-redirect') {
            final deeplinkUrl = action['url'];
            _launchURL(deeplinkUrl);
          }
        }
      }
    } catch (e) {
      print('Error saat transaksi: $e');
    }
  }

  Future<void> _launchGoPayPayment(String qrCodeUrl) async {
    try {
      final response = await launch(qrCodeUrl);
      if (!response) {
        throw 'Tidak dapat membuka URL: $qrCodeUrl';
      }
    } catch (e) {
      print('Error membuka pembayaran GoPay: $e');
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak dapat membuka $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatRupiah = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    final discon = widget.produk.price + 10000;

    return Scaffold(
      backgroundColor: bagroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Custom Ganci Akrilik",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            _buildImageSection(),
            _buildProductDetails(formatRupiah, discon),
            tokoCard(),
            _komentar(),
            _lihatSemuaUlasan(),
            _buildActionButtons(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget tokoCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
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
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage("assets/images/Toko1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vandis Printing",
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  "Percetakan & Banner custom hadiah, ganci, tumbler, plakat",
                  style: blueTextStyle.copyWith(
                    fontSize: 8,
                    fontWeight: light,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage(
                        "assets/images/icon_lokasi.png",
                      ),
                      color: primaryColor,
                      size: 20,
                    ),
                    SizedBox(
                      width: 2.5,
                    ),
                    Container(
                      width: 135,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Jl. Saumata Indah",
                              style: blackTextStyle.copyWith(
                                  fontSize: 6, fontWeight: medium // Teks bold
                                  ),
                            ),
                            TextSpan(
                              text: "12, Somba Opu Gowa, Sulawesi Selatan",
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
                const SizedBox(height: 4),
                Row(
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: soldColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          "8 Sold",
                          style: blueTextStyle.copyWith(fontSize: 8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(widget.produk.image),
        ),
      ),
      height: 194,
      width: double.infinity,
    );
  }

  Widget _buildProductDetails(NumberFormat formatRupiah, int discon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          widget.produk.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formatRupiah.format(widget.produk.price),
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  formatRupiah.format(discon),
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: const [
                Row(
                  children: [
                    Text(
                      "125",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.shopping_cart,
                      size: 13,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 3),
                    Text(
                      "4.6",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.star,
                      size: 13,
                      color: Colors.yellow,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _komentar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Komentar",
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/elon.jpg',
                  width: 24, // ukuran lebar gambar
                  height: 24, // ukuran tinggi gambar
                  fit: BoxFit
                      .cover, // membuat gambar menutupi seluruh area lingkaran
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Martin",
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: medium,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 13,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 13,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 13,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 13,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 13,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.error_outline,
                          size: 16,
                          color: blackColor,
                        )
                      ],
                    ),
                    PhotoKoment(),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Saya sangat senang dengan pembelian gantungan kunci akrilik ini. Desainnya sangat elegan dan terlihat begitu modern. Kualitas akriliknya luar biasa; sangat jernih dan tahan goresan. Saya mencetak logo perusahaan kami di atasnya, dan hasilnya begitu tajam dan profesional.\n\nCincin dan kaitnya sangat kokoh, memberikan kepercayaan bahwa gantungan kunci ini akan bertahan lama. Ukurannya pas dan tidak terlalu besar, membuatnya nyaman untuk dibawa di saku atau digantung di tas.Proses personalisasi sangat mudah dan hasilnya memenuhi harapan saya sepenuhnya. Pengiriman juga sangat cepat dan kemasan produk sangat baik.",
                      style: blackTextStyle.copyWith(fontSize: 8),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _lihatSemuaUlasan() {
    return Container(
      width: double.infinity,
      height: 42,
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          "Lihat Semua Ulasan (12)",
          style: blueTextStyle.copyWith(fontSize: 14, fontWeight: medium),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Chat",
                  style: blueTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor,
                foregroundColor: primaryColor,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                )),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                // try {
                //   final orderId =
                //       "order-${DateTime.now().millisecondsSinceEpoch}";
                //   final response = await TransactionService.createTransaction(
                //     price: produk.price,
                //     orderId: orderId,
                //     firstName: "NamaDepan",
                //     lastName: "NamaBelakang",
                //     email: "email@example.com",
                //     phone: "081234567890",
                //   );

                //   print('Transaction successful: $response');

                //   if (response['actions'] != null) {
                //     for (var action in response['actions']) {
                //       if (action['name'] == 'generate-qr-code') {
                //         final qrCodeUrl = action['url'];
                //         _launchGoPayPayment(qrCodeUrl);
                //       } else if (action['name'] == 'deeplink-redirect') {
                //         final deeplinkUrl = action['url'];
                //         _launchURL(
                //             deeplinkUrl); // Redirect ke GoPay menggunakan deeplink
                //       }
                //     }
                //   }
                // } catch (e) {
                //   print('Error during transaction: $e');
                // }
                // _showPaymentMethodPopup(context);

                try {
                  // Panggil API untuk mendapatkan Snap URL
                  final snapUrl =
                      "https://app.sandbox.midtrans.com/snap/v2/vtweb/YOUR-SNAP-TOKEN";

                  // Buka halaman WebView
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(snapUrl: snapUrl),
                    ),
                  );
                } catch (e) {
                  print("Error loading payment: $e");
                }
              },
              child: Text(
                "Beli Sekarang",
                style:
                    whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
