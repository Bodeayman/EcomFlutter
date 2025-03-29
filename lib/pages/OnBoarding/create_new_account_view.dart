import 'package:ecomflutter/pages/OnBoarding/Widgets/login_text_field.dart';
import 'package:flutter/material.dart';

class CreateNewAccountView extends StatefulWidget {
  const CreateNewAccountView({super.key});

  @override
  State<CreateNewAccountView> createState() => _CreateNewAccountViewState();
}

class _CreateNewAccountViewState extends State<CreateNewAccountView> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LoginTextField(controller: _emailController),
          LoginTextField(controller: _emailController),
          LoginTextField(controller: _emailController),
          LoginTextField(controller: _emailController),
        ],
      ),
    );
  }
}
