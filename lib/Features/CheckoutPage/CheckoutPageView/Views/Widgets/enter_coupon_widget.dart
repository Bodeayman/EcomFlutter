import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
        width: double.infinity,
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
            contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            border: InputBorder.none,
            hintText: "Enter the coupon",
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  color: appbarSec,
                  borderRadius: BorderRadius.circular(kExtremeRaduis),
                ),
                child: IconButton(
                  onPressed: () {
                    if (textController.text == "12345") {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(message: "Discount applied 10%"),
                      );
                      context.read<CartCubit>().applyDiscount();
                    } else {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(message: "This Coupon is invalid"),
                      );
                      context.read<CartCubit>().applyDiscount();
                    }
                  },
                  icon: Image.asset(
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
