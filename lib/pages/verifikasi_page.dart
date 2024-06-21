import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartprint/widgets/code_textfield.dart';
import 'package:smartprint/widgets/costum_button.dart';
import 'package:smartprint/widgets/costum_divider.dart';

import '../shared/theme.dart';

class VerifikasiPage extends StatelessWidget {
  const VerifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          "Verifikasi",
          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            Center(
              child: Container(
                width: 280,
                child: Text(
                  textAlign: TextAlign.center,
                  "Silahkan periksa email anda",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: regular,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CodeTextField(),
                CodeTextField(),
                CodeTextField(),
                CodeTextField(),
              ],
            ),
            SizedBox(
              height: 36,
            ),
            CostumButton(title: "Lanjutkan"),
            SizedBox(
              height: 36,
            ),
            CostumDivider(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tidak menerima kode OTP?",
                  style:
                      greyTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Kirim Ulang",
                      style: blueTextStyle.copyWith(fontWeight: medium),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
