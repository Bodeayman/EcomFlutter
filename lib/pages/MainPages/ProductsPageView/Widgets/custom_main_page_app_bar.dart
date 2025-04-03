import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomMainPageAppBar extends StatelessWidget {
  const CustomMainPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: 40,
            width: 40,
            child: Image.asset("assets/img/stripe.png"),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 72,
            height: 40,
            decoration: BoxDecoration(color: kTextForm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Men", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 16,
                  height: 16,
                  child: Image.asset("assets/arrowdown2.png"),
                ),
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            decoration: BoxDecoration(color: appbarSec),
            height: 40,
            width: 40,
            child: Image.asset("assets/bag2.png"),
          ),
        ),
      ],
    );
  }
}
