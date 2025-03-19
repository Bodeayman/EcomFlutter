import 'package:ecomflutter/pages/Register/register.dart';
import 'package:flutter/material.dart';

class CheckLoginSen extends StatelessWidget {
  const CheckLoginSen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?", style: TextStyle(fontSize: 15)),
        TextButton(
          child: const Text("Sign up"),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Register()),
            );
          },
        ),
      ],
    );
  }
}
