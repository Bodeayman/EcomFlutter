import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileDetailsTile extends StatelessWidget {
  const ProfileDetailsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(color: kTextForm),
        height: 90,
        width: 342,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gilbert Strang",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("gilbertstrang@gmail.com"),
                  Text("112-123-21390"),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        color: appbarSec,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
