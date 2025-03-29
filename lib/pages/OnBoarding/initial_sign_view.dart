import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_text_field.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/sign_in_text.dart';
import 'package:flutter/material.dart';

class InitialSignView extends StatelessWidget {
  const InitialSignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [SignInText(), LoginTextField(), LoginMaterialButton()],
      ),
    );
  }
}
