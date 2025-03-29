import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 56,
        width: 342,
        decoration: BoxDecoration(color: Color(0xffF4F4F4)),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Please enter your email";
            }
            return null;
          },
          decoration: InputDecoration(
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            fillColor: Color(0xffF4F4F4),
            hintText: "Email Address",
          ),
        ),
      ),
    );
  }
}
