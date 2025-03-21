import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/Home/home_view.dart';
import 'package:flutter/material.dart';

class CustomValidButton extends StatelessWidget {
  const CustomValidButton({
    super.key,
    required this.formKey,
    required this.buttonText,
  });
  final GlobalKey<FormState> formKey;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          FocusScope.of(context).unfocus();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Home()),
          );
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(appbarSec),
        padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 19, color: Colors.white),
      ),
    );
  }
}
