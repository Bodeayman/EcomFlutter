import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 342,
      decoration: BoxDecoration(color: Color(0xffF4F4F4)),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Color(0xffF4F4F4),
          hintText: "Email Address",
        ),
      ),
    );
  }
}
