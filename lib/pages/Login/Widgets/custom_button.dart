import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/Home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()),
        );
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(BTNgreen),
        padding: WidgetStateProperty.all(EdgeInsets.all(12)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      child: Text("Login", style: TextStyle(fontSize: 19, color: Colors.white)),
    );
  }
}
