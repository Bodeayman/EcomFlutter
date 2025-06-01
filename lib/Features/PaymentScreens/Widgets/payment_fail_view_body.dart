import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class PaymentFailViewBody extends StatelessWidget {
  const PaymentFailViewBody({super.key});

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
              return Transform.scale(
                scale: value,
                child: Opacity(
                  opacity: value,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(color: Colors.red),
                      child: Icon(Icons.close, color: Colors.white, size: 40),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Text(
            "Payment Failure",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Something wrong happened while paying, please try again",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ),
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
