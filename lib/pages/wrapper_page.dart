import 'package:flutter/material.dart';
import 'package:smartprint/pages/beranda_page.dart';
import 'package:smartprint/pages/chat_page.dart';
import 'package:smartprint/pages/hapus.dart';
import 'package:smartprint/pages/pesanan_page.dart';
import 'package:smartprint/pages/pesanan_page2.dart';
import 'package:smartprint/pages/profil_page.dart';

import '../widgets/bottom_navigation.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({
    Key? key,
  }) : super(key: key);

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  int selectedIndex = 0;
  final List<Widget> screens = [
    const BerandaPage(),
    // TimelinePage(),
    PesananPage2(),
    // const PesananPage(),
    const ChatPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomSheet: BottomNavigationWidget(
        selectedIndex: selectedIndex,
        onTap: (val) {
          setState(() {
            selectedIndex = val;
          });
        },
      ),
    );
  }
}




