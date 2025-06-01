import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    TickIcon(),
                    const SizedBox(width: 10),
                    Text("Delivered"),
                  ],
                ),
              ),
              Text("May 22"),
            ],
          ),
        ),
        SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    TickIcon(),
                    const SizedBox(width: 10),
                    Text("Shipped"),
                  ],
                ),
              ),
              Text("May 22"),
            ],
          ),
        ),
        SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    TickIcon(),
                    const SizedBox(width: 10),
                    Text("Order Confirmed"),
                  ],
                ),
              ),
              Text("May 22"),
            ],
          ),
        ),
        SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    TickIcon(),
                    const SizedBox(width: 10),
                    Text("Order Shipped"),
                  ],
                ),
              ),
              Text("May 22"),
            ],
          ),
        ),
      ],
    );
  }
}

class TickIcon extends StatelessWidget {
  const TickIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kExtremeRaduis),
      child: SizedBox(
        height: 24,
        width: 24,
        child: Container(
          color: appbarSec,
          child: Icon(Icons.done, color: Colors.white, size: 15),
        ),
      ),
    );
  }
}
