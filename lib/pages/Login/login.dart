import 'package:ecomflutter/pages/Login/Widgets/check_login_sen.dart';
import 'package:ecomflutter/pages/Login/Widgets/custom_button.dart';
import 'package:ecomflutter/pages/Login/Widgets/custom_text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              CustomTextInput(hint: "Enter the email", obscure: false),
              const SizedBox(height: 33),
              CustomTextInput(hint: "Enter the password", obscure: true),
              const SizedBox(height: 33),
              CustomButton(text: "Login"),
              const SizedBox(height: 24),
              CheckLoginSen(),
            ],
          ),
        ),
      ),
    );
  }
}
