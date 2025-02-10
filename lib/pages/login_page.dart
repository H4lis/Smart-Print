import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartprint/pages/beranda_page.dart';
import 'package:smartprint/pages/daftar_page.dart';
import 'package:smartprint/pages/wrapper_page.dart';
import 'package:smartprint/shared/theme.dart';
import 'package:smartprint/widgets/costum_button.dart';
import 'package:smartprint/widgets/costum_divider.dart';
import 'package:smartprint/widgets/option_login.dart';

import '../widgets/costum_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailC = TextEditingController();

  TextEditingController passC = TextEditingController();

  bool _obscurePassword = true;

  void login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailC.text,
          password: passC.text,
        );
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Login Berhasil"),
            content: const Text("Akun Anda berhasil masuk."),
          ),
        );

// Menunggu beberapa detik, lalu menutup dialog dan mengarahkan ke halaman berikutnya
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context); // Menutup dialog
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WrapperPage(),
            ),
          );
        });
      } on FirebaseAuthException catch (e) {
        String errorMessage = '';
        if (e.code == 'user-not-found') {
          errorMessage =
              'Tidak ada pengguna yang ditemukan untuk email tersebut.';
        } else if (e.code == 'wrong-password' ||
            e.code == 'invalid-credential') {
          errorMessage = 'Password yang Anda masukkan salah.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'Email yang Anda masukkan salah.';
        } else {
          errorMessage = 'Terjadi kesalahan. Silakan coba lagi.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      }
    } else if (emailC.text.isEmpty && passC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: const Text('Email dan password harus diisi.'),
        ),
      );
    } else if (passC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password harus diisi.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email harus diisi.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appbarHeight = AppBar().preferredSize.height;
    final bodyHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: bagroundColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: Text(
            "Login",
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 24),
            height: bodyHeight - appbarHeight,
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Container(
                    width: 280,
                    child: Text(
                      textAlign: TextAlign.center,
                      "\"Dapatkan produk impian Anda dalam sekejap! Cetak cepat dengan login sekarang.\"",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                CostumTextField(
                  controller: emailC,
                  title: "Email",
                  hintText: "Email Anda",
                  iconImage: "assets/images/icon_email.png",
                ),
                CostumTextField(
                  controller: passC,
                  obscureText: true,
                  title: "Password",
                  hintText: "Password Anda",
                  iconImage: "assets/images/Icon_lock.png",
                ),
                SizedBox(
                  height: 6,
                ),
                CostumButton(
                  onPressed: () {
                    login();
                  },
                  title: "Login",
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Lupa Password?",
                      style: blueTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                CostumDivider(),
                SizedBox(
                  height: 22,
                ),
                OptionLogin(),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum Punya Akun?",
                      style: greyTextStyle.copyWith(
                          fontWeight: medium, fontSize: 14),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DaftarPage(),
                              ));
                        },
                        child: Text(
                          "Daftar",
                          style: blueTextStyle.copyWith(fontWeight: medium),
                        ))
                  ],
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ));
  }
}
