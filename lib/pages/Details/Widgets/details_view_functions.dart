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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Color",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                SizedBox(
                  height: kIconSize,
                  width: kIconSize,
                  child: IconButton(
                    onPressed: context.pop,
                    icon: Icon(Icons.close),
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
