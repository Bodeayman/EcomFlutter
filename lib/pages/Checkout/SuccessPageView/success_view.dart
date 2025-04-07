import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: Image.asset("assets/orderSuccess.png")),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Order Placed Successfully",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "You recieved the confirmation email",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  const SizedBox(height: 100),
                  SizedBox(
                    height: 52,
                    width: 342,
                    child: CustomeElevatedButton(
                      buttonColor: appbarSec,
                      hintText: "See Orders Details",
                      textColor: Colors.white,
                      callbackFunction: () {
                        context.pushReplacement('/');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: appbarSec,
    );
  }
}
