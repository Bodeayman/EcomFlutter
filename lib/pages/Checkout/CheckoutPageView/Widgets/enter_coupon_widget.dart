import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:flutter/material.dart';

class EnterCouponWidget extends StatelessWidget {
  const EnterCouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kSettingsTile),
      child: Container(
        height: 56,
        width: 342,
        decoration: BoxDecoration(color: Colors.grey[300]),

        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset("assets/discountshape.png"),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 16),
            border: InputBorder.none,
            hintText: "Enter the coupon",
            suffixIcon: ClipRRect(
              borderRadius: BorderRadius.circular(kExtremeRaduis),
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(color: appbarSec),
                child: RawMaterialButton(
                  onPressed: () {},
                  child: Image.asset(
                    "assets/arrowright2.png",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
