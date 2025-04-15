import 'package:ecomflutter/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPriceList extends StatelessWidget {
  const CheckoutPriceList({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal: ',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  "\$${context.read<Cart>().totalPrice}",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping: ',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  "\$${context.read<Cart>().totalPrice * 0.2}",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax: ',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  "\$${context.read<Cart>().totalPrice * 0.1}",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  "\$${context.read<Cart>().totalPrice * 1.3}",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
