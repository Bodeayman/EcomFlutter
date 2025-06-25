import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ColorListTile extends StatelessWidget {
  ColorListTile({
    super.key,
    required this.colorAddress,
    required this.colorName,
  });
  String colorName;
  Color colorAddress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kExtremeRaduis),

      onTap: () => context.pop(),

      child: SizedBox(
        height: 54,
        width: 342,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kExtremeRaduis),
          child: Container(
            color: kTextForm,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  colorName,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kExtremeRaduis),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Container(color: colorAddress),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(Icons.check),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
