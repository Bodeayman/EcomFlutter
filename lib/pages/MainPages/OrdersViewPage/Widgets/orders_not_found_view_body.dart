import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersNotFoundViewBody extends StatelessWidget {
  const OrdersNotFoundViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Column(
            children: [
              Image.asset("assets/order_cart_image.png"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  "No Orders yet",
                  style: TextStyle(
                    fontSize: kNoTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 52,
                width: 195,
                child: CustomeElevatedButton(
                  buttonColor: appbarSec,
                  callbackFunction: () {
                    context.push('/search');
                  },
                  hintText: "Explore Categories",
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
