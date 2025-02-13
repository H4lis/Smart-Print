import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/theme.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 50,
      child: TextField(

        decoration: InputDecoration(
          filled: true,
          fillColor: greyLightColor,
          hintStyle: greyTextStyle.copyWith(fontSize: 14),
          contentPadding: EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: greyColor,
            ),
          ),
        ),
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}
