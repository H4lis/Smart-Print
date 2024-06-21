// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smartprint/shared/theme.dart';

class CostumTextField extends StatefulWidget {
  final title;
  final hintText;
  final iconImage;
  bool obscureText;

  CostumTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.iconImage,
    this.obscureText = false,
  });

  @override
  State<CostumTextField> createState() => _CostumTextFieldState();
}

class _CostumTextFieldState extends State<CostumTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText; // Initialize with the provided value
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: blackTextStyle.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 48,
          child: TextField(
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(13),
                child: ImageIcon(
                  AssetImage(
                    widget.iconImage,
                  ),
                  color: greyColor,
                  size: 8,
                ),
              ),
              hintText: widget.hintText,
              hintStyle: greyTextStyle.copyWith(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: greyColor,
                ),
              ),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        _isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: greyColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
        SizedBox(
          height: 18,
        )
      ],
    );
  }
}
