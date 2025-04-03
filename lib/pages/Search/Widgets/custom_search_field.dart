import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),

        child: Container(
          decoration: BoxDecoration(color: kTextForm),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: Colors.grey,
              prefixIcon: Image.asset("assets/searchnormal1.png"),
            ),
          ),
        ),
      ),
    );
  }
}
