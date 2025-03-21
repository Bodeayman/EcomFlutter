import 'package:ecomflutter/pages/Login/Widgets/check_login_sen.dart';
import 'package:ecomflutter/pages/Login/Widgets/custom_button.dart';
import 'package:ecomflutter/pages/Login/Widgets/custom_text_input.dart';
import 'package:ecomflutter/pages/Register/Widgets/custom_valid_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 64),
                CustomTextInput(
                  errorMessage: "Please enter the email",
                  hint: "Enter the email",
                  obscure: false,
                  controller: emailController,
                ),
                const SizedBox(height: 33),
                CustomTextInput(
                  errorMessage: "Please enter the password",
                  hint: "Enter the password",
                  obscure: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 33),
                CustomValidButton(formKey: _formKey, buttonText: "Login"),
                const SizedBox(height: 24),
                CheckLoginSen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class _RegisterState extends State<Register> {
//   final _formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(30),
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 128),
//                   CustomValidField(
//                     controller: nameController,
//                     errorMessage: "Please enter the username",
//                     hintMessage: "Username",
//                   ),
//                   const SizedBox(height: 33),
//                   CustomValidField(
//                     controller: emailController,
//                     errorMessage: "Please enter the Email",
//                     hintMessage: "Email",
//                   ),
//                   const SizedBox(height: 33),
//                   CustomValidField(
//                     controller: passwordController,
//                     errorMessage: "Please enter the password",
//                     hintMessage: "Password",
//                   ),
//                   const SizedBox(height: 33),
//                   CustomValidButton(formKey: _formKey),
//                   const SizedBox(height: 24),
//                   CheckRegisterSen(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
