import 'dart:ui';

import 'package:ecomflutter/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showColors(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Stack(
              children: [
                Center(
                  child: Text(
                    "Colors",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                ),
                Positioned(
                  right: 50,
                  child: SizedBox(
                    height: kIconSize,
                    width: kIconSize,
                    child: IconButton(
                      onPressed: context.pop,
                      icon: Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

void showSizes(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Stack(
              children: [
                Center(
                  child: Text(
                    "Sizes",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                ),
                Positioned(
                  right: 50,
                  child: SizedBox(
                    height: kIconSize,
                    width: kIconSize,
                    child: IconButton(
                      onPressed: context.pop,
                      icon: Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
