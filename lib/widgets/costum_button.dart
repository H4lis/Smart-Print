// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:smartprint/pages/verifikasi_page.dart';

class CostumButton extends StatelessWidget {
  final title;
  final Function() onPressed;
  const CostumButton({
    Key? key,
    required this.onPressed,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff3342DD),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 48),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}
