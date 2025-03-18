import 'package:ecomflutter/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({super.key, required this.hint, required this.obscure});
  final String hint;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscure,
      decoration: inputDec.copyWith(hintText: hint),
    );
  }
}
