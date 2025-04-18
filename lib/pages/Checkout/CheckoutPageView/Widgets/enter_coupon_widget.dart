import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnterCouponWidget extends StatefulWidget {
  const EnterCouponWidget({super.key});

  @override
  State<EnterCouponWidget> createState() => _EnterCouponWidgetState();
}

class _EnterCouponWidgetState extends State<EnterCouponWidget> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kSettingsTile),
      child: Container(
        height: 56,
        width: 342,
        decoration: BoxDecoration(color: Colors.grey[300]),

        child: TextField(
          controller: textController,
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
                  onPressed:
                      () => {
                        if (textController.text == "12345")
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Discount applied 10%")),
                            ),
                            context.read<CartCubit>().applyDiscount(),
                          },
                      },
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
