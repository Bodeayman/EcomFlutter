import 'package:ecomflutter/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomValidField extends StatelessWidget {
  const CustomValidField({
    super.key,
    required this.controller,
    required this.errorMessage,
    required this.hintMessage,
  });
  final TextEditingController controller;
  final String errorMessage;
  final String hintMessage;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: inputDec.copyWith(hintText: hintMessage),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }
}
