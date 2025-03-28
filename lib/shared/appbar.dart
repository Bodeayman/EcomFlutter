import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.leftArrow});
  final bool leftArrow;

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("JimTan"),
      backgroundColor: appbarSec,

      leading:
          widget.leftArrow
              ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
              : null,
      actions: [
        Consumer<Cart>(
          builder: (context, value, child) {
            return Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      padding: const EdgeInsets.only(right: 8, top: 15),
                      icon: const Icon(Icons.shopping_cart, size: 30),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: btnPink,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        "${value.selectedElements.length}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "${value.totalPrice}\$",
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
