import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/Register/register.dart';
import 'package:ecomflutter/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ecomflutter/constants/constant.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          //Padding is required in the application for the
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              const TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: false,
                // Obscure is for the password
                decoration: inputDec,
              ),
              const SizedBox(height: 33),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                // Obscure is for the password
                decoration: inputDec.copyWith(hintText: "Enter the password"),
                // Second way to change the code
              ),
              const SizedBox(height: 33),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(BTNgreen),
                  padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
                  shape: WidgetStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                    child: const Text("Sign up"),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
