import 'package:flutter/material.dart';

class SignInText extends StatelessWidget {
  const SignInText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 99,
      child: Text(
        "Sign in",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }
}
