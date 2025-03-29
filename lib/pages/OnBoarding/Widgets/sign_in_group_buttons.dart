import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInGroupButtons extends StatelessWidget {
  const SignInGroupButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 171,
      child: Column(
        children: [
          SizedBox(
            height: kLoginScreenButtonHeight,
            child: CustomeElevatedButton(
              buttonColor: kTextForm,
              prefixIcon: FontAwesomeIcons.apple,
              hintText: "Continue with Apple",
              textColor: Colors.black,
              iconColor: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: kLoginScreenButtonHeight,

            child: CustomeElevatedButton(
              buttonColor: kTextForm,
              prefixIcon: FontAwesomeIcons.google,
              hintText: "Continue with Google",
              iconColor: Colors.red,
              textColor: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: kLoginScreenButtonHeight,

            child: CustomeElevatedButton(
              buttonColor: kTextForm,

              prefixIcon: FontAwesomeIcons.facebook,
              hintText: "Continue with Facebook",
              iconColor: Colors.blue,
              textColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
