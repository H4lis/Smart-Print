import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartprint/pages/login_page.dart';
import 'package:smartprint/pages/verifikasi_page.dart';
import 'package:smartprint/pages/wrapper_page.dart';
import 'package:smartprint/shared/theme.dart';
import 'package:smartprint/widgets/costum_button.dart';
import 'package:smartprint/widgets/costum_divider.dart';
import 'package:smartprint/widgets/option_login.dart';

import '../widgets/costum_text_field.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({super.key});

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController nameC = TextEditingController();

  TextEditingController emailC = TextEditingController();

  TextEditingController passC = TextEditingController();
  TextEditingController passKonfirmasiC = TextEditingController();

  bool _isChecked = false;

  bool _obscurePassword = true;
  void daftar() async {
    if (nameC.text.isEmpty || emailC.text.isEmpty || passC.text.isEmpty) {
      String errorMessage = '';

      if (nameC.text.isEmpty) {
        errorMessage = 'Nama tidak boleh kosong.';
      } else if (emailC.text.isEmpty) {
        errorMessage = 'Email tidak boleh kosong.';
      } else if (passC.text.isEmpty) {
        errorMessage = 'Password tidak boleh kosong.';
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Kesalahan"),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }
    if (passC.text != passKonfirmasiC.text) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Kesalahan"),
          content: const Text("Password dan Konfirmasi Password tidak cocok."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailC.text,
        password: passC.text,
      );
      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        await firestore.collection('users').doc(uid).set({
          'name': nameC.text,
          'email': emailC.text,
          'createdAt': DateTime.now().toIso8601String(),
        });
        userCredential.user!.sendEmailVerification();

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Pendaftaran Berhasil"),
            content: const Text("Akun Anda berhasil dibua"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WrapperPage(),
                      ));
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'user-not-found') {
        errorMessage =
            'Tidak ada pengguna yang ditemukan untuk email tersebut.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Email Anda tidak sesuai.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Password yang Anda masukkan salah.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'Password yang diberikan terlalu lemah.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'Akun dengan email tersebut sudah ada.';
      } else {
        errorMessage = 'Terjadi kesalahan. Silakan coba lagi.';
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Kesalahan"),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
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
            "Daftar",
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
                      "\"Buat akun dan temukan apa yang anda inginkan.\"",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CostumTextField(
                  controller: nameC,
                  title: "Username",
                  hintText: "Nama panggilan anda",
                  iconImage: "assets/images/icon_person.png",
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
                CostumTextField(
                  controller: passKonfirmasiC,
                  obscureText: true,
                  title: "Konfirmasi Password",
                  hintText: "Password Anda",
                  iconImage: "assets/images/Icon_lock.png",
                ),
                SizedBox(
                  height: 6,
                ),
                CostumButton(
                  onPressed: () {
                    daftar();
                  },
                  title: "Daftar",
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
                                builder: (context) => LoginPage(),
                              ));
                        },
                        child: Text(
                          "Login",
                          style: blueTextStyle.copyWith(fontWeight: medium),
                        ))
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ));
  }
}
