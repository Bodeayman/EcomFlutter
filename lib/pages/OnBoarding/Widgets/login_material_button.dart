import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomeElevatedButton extends StatelessWidget {
  const CustomeElevatedButton({
    super.key,
    required this.buttonColor,
    required this.hintText,
    required this.textColor,
    this.prefixIcon,
    this.iconColor,
    this.callbackFunction,
  });
  final Color buttonColor;
  final String hintText;
  final IconData? prefixIcon;
  final Color? iconColor;
  final Color textColor;
  final VoidCallback? callbackFunction;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        width: 344,
        height: 49,
        child: InkWell(
          onTap: callbackFunction,

          child: Container(
            decoration: BoxDecoration(color: buttonColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: (prefixIcon != null) ? 20 : 0,
                  child:
                      (prefixIcon != null)
                          ? Icon(prefixIcon, size: 25, color: iconColor)
                          : null,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      maxLines: 1,

                      hintText,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
