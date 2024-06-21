import 'package:flutter/material.dart';
import 'package:smartprint/pages/daftar_page.dart';
import 'package:smartprint/shared/theme.dart';
import 'package:smartprint/widgets/costum_button.dart';
import 'package:smartprint/widgets/costum_divider.dart';
import 'package:smartprint/widgets/option_login.dart';

import '../widgets/costum_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bagroundColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: Text(
            "Login",
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              const SizedBox(
                height: 48,
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
              SizedBox(
                height: 6,
              ),
              CostumButton(
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
        ));
  }
}
