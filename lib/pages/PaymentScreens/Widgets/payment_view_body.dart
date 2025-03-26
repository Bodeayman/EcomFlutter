import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Payment Success",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            color: btnPink,
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Go back", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
