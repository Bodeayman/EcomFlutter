import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/PaymentScreens/Widgets/payment_view_body.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: appbarSec, title: Text("Success")),
      body: PaymentViewBody(),
    );
  }
}
