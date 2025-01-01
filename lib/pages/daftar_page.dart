import 'package:flutter/material.dart';
import 'package:smartprint/pages/login_page.dart';
import 'package:smartprint/pages/verifikasi_page.dart';
import 'package:smartprint/shared/theme.dart';
import 'package:smartprint/widgets/costum_button.dart';
import 'package:smartprint/widgets/costum_divider.dart';
import 'package:smartprint/widgets/option_login.dart';

import '../widgets/costum_text_field.dart';

class DaftarPage extends StatelessWidget {
  const DaftarPage({super.key});

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
                  title: "Username",
                  hintText: "Nama panggilan anda",
                  iconImage: "assets/images/icon_person.png",
                ),
                CostumTextField(
                  title: "Email",
                  hintText: "Email Anda",
                  iconImage: "assets/images/icon_email.png",
                ),
                CostumTextField(
                  obscureText: true,
                  title: "Password",
                  hintText: "Password Anda",
                  iconImage: "assets/images/Icon_lock.png",
                ),
                CostumTextField(
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
                    
                      Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifikasiPage(),
            ));
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
