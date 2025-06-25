import 'package:ecomflutter/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    required this.hint,
    required this.obscure,
    required this.controller,
    required this.errorMessage,
  });
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscure,
      controller: controller,
      decoration: inputDec.copyWith(hintText: hint),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }
}
