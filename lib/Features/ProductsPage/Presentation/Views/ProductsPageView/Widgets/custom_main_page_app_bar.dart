import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Manager/cart_cubit.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomMainPageAppBar extends StatelessWidget {
  const CustomMainPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: 40,
            width: 40,
            child: Image.asset("assets/img/stripe.png"),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: 72,
            height: 40,
            // decoration: BoxDecoration(color: kTextForm),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text("Men", style: TextStyle(fontWeight: FontWeight.bold)),
            //     SizedBox(
            //       width: 16,
            //       height: 16,
            //       child: Image.asset("assets/arrowdown2.png"),
            //     ),
            //   ],
            // ),
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () => context.push("/cart"),
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  decoration: BoxDecoration(color: appbarSec),
                  height: 40,
                  width: 40,
                  child: Image.asset("assets/bag2.png"),
                ),
              ),
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (context.read<CartCubit>().state.selectedItems.isNotEmpty) {
                  return Positioned(
                    right: 0,
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kExtremeRaduis),
                        color: Colors.red,
                      ),
                      width: 20,
                      child: Center(
                        child: Text(
                          "${context.read<CartCubit>().state.selectedItems.length}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Positioned(child: Container());
              },
            ),
          ],
        ),
      ],
    );
  }
}
