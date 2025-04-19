import 'package:ecomflutter/model/order.dart';
import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key, required this.order});
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Delivered"), Text(order.date)],
          ),
        ),
        SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Shipped"), Text(order.date)],
          ),
        ),
        SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Order Confirmed"), Text(order.date)],
          ),
        ),
        SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Order Shipped"), Text(order.date)],
          ),
        ),
      ],
    );
  }
}
