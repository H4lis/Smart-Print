import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartprint/pages/login_page.dart';
import 'package:smartprint/pages/notifikasi_page.dart';
import 'package:smartprint/shared/theme.dart';
import 'package:smartprint/widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget profileInfo() {
      return Column(
        children: [
          const SizedBox(
            height: 38,
          ),
          Center(
            child: Stack(
              children: [
                // Foto profil
                CircleAvatar(
                  radius: 60, // Ukuran foto profil
                  backgroundImage: const AssetImage(
                      'assets/images/elon.jpg'), // Ganti dengan path foto profil Anda
                  backgroundColor:
                      Colors.grey[200], // Warna background jika foto tidak ada
                ),
                // Ikon edit
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // Tindakan saat ikon edit ditekan
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(
                          5), // Padding untuk membuat ikon lebih besar
                      child: ImageIcon(
                          const AssetImage(
                            "assets/icons/edit_square.png",
                          ),
                          size: 22,
                          color: blackColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            "Dytech",
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
          ),
          Text(
            "0812-5343-8311",
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bagroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Text(
          "Profile",
          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              iconSize: 26,
              icon: const Icon(Icons.notifications_none),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotifikasiPage(),
                    ));
              },
              color: blackColor, // Ganti warna sesuai dengan kebutuhan Anda
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: SingleChildScrollView(
          child: Column(
            children: [
              profileInfo(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Divider(),
              ),
              // Gunakan ProfileCard dengan menambahkan fungsi onTap untuk setiap item
              ProfileCard(
                icon: "assets/icons/person.png",
                title: "Edit Profil",
                onTap: () {
                  // Tindakan yang dilakukan saat Edit Profil dipilih
                  // Arahkan ke halaman edit profil atau lakukan aksi lainnya
                },
              ),
              ProfileCard(
                icon: "assets/icons/lokasi.png",
                title: "Alamat",
                onTap: () {
                  // Tindakan yang dilakukan saat Alamat dipilih
                },
              ),
              ProfileCard(
                icon: "assets/icons/credit_card.png",
                title: "Metode Pembayaran",
                onTap: () {
                  // Tindakan yang dilakukan saat Metode Pembayaran dipilih
                },
              ),
              const SizedBox(
                height: 24,
              ),
              ProfileCard(
                icon: "assets/icons/headset.png",
                title: "Smart Service",
                onTap: () {
                  // Tindakan yang dilakukan saat Smart Service dipilih
                },
              ),
              ProfileCard(
                icon: "assets/icons/gear.png",
                title: "Pengaturan Akun",
                onTap: () {
                  // Tindakan yang dilakukan saat Pengaturan Akun dipilih
                },
              ),
              const SizedBox(
                height: 24,
              ),
              ProfileCard(
                icon: "assets/icons/logout.png",
                title: "Keluar",
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  // Setelah logout, arahkan ke halaman login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  // Tindakan logout (misalnya panggil fungsi logout)
                },
              ),
              const SizedBox(
                height: 304,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
