import 'package:flutter/material.dart';

class CustomeElevatedButton extends StatefulWidget {
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
  State<CustomeElevatedButton> createState() => _CustomeElevatedButtonState();
}

class _CustomeElevatedButtonState extends State<CustomeElevatedButton> {
  double _scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.95),
      onTapUp: (_) => setState(() => _scale = 1.0),
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(milliseconds: 50),
        curve: Curves.easeOut,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: double.infinity,
            height: 49,
            child: MaterialButton(
              onPressed: widget.callbackFunction,
              color: widget.buttonColor,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: (widget.prefixIcon != null) ? 20 : 0,
                    child:
                        (widget.prefixIcon != null)
                            ? Icon(
                              widget.prefixIcon,
                              size: 25,
                              color: widget.iconColor,
                            )
                            : null,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        maxLines: 1,

                        widget.hintText,
                        style: TextStyle(color: widget.textColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
