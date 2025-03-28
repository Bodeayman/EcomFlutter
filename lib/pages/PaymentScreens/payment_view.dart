import 'dart:ffi';
import 'dart:math';

import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/PaymentScreens/Widgets/payment_fail_view_body.dart';
import 'package:ecomflutter/pages/PaymentScreens/Widgets/payment_success_view_body.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.totalPrice});
  final double totalPrice;
  // final bool isPaymentSuccess;

  @override
  Widget build(BuildContext context) {
    bool random = Random().nextBool(); // just for test

    return Scaffold(
      appBar: AppBar(backgroundColor: appbarSec, title: Text("Success")),
      body:
          random
              ? PaymentSuccessViewBody(totalPrice: totalPrice)
              : PaymentFailViewBody(),
    );
  }
}
