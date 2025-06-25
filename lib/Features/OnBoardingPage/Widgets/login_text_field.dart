import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validatorFunction,
  });
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator validatorFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kBorderSize),
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xffF4F4F4)),
          child: TextFormField(
            controller: controller,
            validator: validatorFunction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              hintStyle: TextStyle(color: kTextFieldHint),
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              fillColor: Color(0xffF4F4F4),
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}
