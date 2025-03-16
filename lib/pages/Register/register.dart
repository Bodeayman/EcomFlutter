import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:ecomflutter/constants/constant.dart';
import 'package:ecomflutter/pages/Login/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 64),

                  // Username Field
                  TextFormField(
                    controller: nameController,
                    decoration: inputDec.copyWith(
                      hintText: "Enter the Username",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 33),

                  // Email Field (Converted to TextFormField)
                  TextFormField(
                    controller: emailController,
                    decoration: inputDec.copyWith(hintText: "Enter your email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 33),

                  // Password Field (Converted to TextFormField)
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: inputDec.copyWith(
                      hintText: "Enter the password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 33),

                  // Register Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(BTNgreen),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.all(12),
                      ),
                      shape: WidgetStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Sign In Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextButton(
                        child: const Text("Sign in"),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
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
        ),
      ),
    );
  }
}
