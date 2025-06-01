import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class PaymentSuccessViewBody extends StatelessWidget {
  const PaymentSuccessViewBody({super.key, required this.totalPrice});
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 200), // Animation time
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, value, child) {
              return Transform.rotate(
                angle: value * 2 * 3.1416,
                child: Transform.scale(
                  scale: value,
                  child: Opacity(
                    opacity: value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(color: Colors.green),
                        child: Icon(Icons.check, color: Colors.white, size: 40),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Text(
            "Payment Success",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text("Total price is $totalPrice\$", style: TextStyle(fontSize: 17)),
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
