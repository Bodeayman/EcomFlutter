import 'package:ecomflutter/pages/Login/login.dart';
import 'package:flutter/material.dart';

class CheckRegisterSen extends StatelessWidget {
  const CheckRegisterSen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?", style: TextStyle(fontSize: 15)),
        TextButton(
          child: const Text("Sign in"),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
        ),
      ],
    );
  }
}
