import 'package:flutter/material.dart';
import 'package:smartprint/shared/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          title: Text(
            "Chat",
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 75,
            ),
            Center(
              child: Image.asset(
                "assets/images/chat_info.png",
                width: 296,
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Center(
              child: Text(
                "Yah belum ada yang chat nih \n“^~^",
                textAlign: TextAlign.center,
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
              ),
            ),
          ],
        ));
    ;
  }
}
