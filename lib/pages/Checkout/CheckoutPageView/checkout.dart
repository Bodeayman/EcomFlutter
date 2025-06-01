import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/cubit/cart_cubit.dart';
import 'package:ecomflutter/pages/Checkout/CheckoutPageView/Widgets/checkout_price.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key, required this.totalPrice});
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.selectedItems.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top scrollable section
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RawMaterialButton(
                                  onPressed: () => context.pop(),
                                  constraints: BoxConstraints.tightFor(
                                    width: 50,
                                    height: 50,
                                  ),
                                  shape: const CircleBorder(),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: kTextForm,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Image.asset("assets/arrowleft2.png"),
                                  ),
                                ),
                                const Expanded(
                                  child: Center(
                                    child: Text(
                                      "Checkout",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 40, height: 40),
                              ],
                            ),
                          ),
                          OptionListTile(
                            title: "Add payment method",
                            subtitle: "Payment methods",
                            trailing: IconButton(
                              icon: Image.asset("assets/arrowright2.png"),
                              onPressed: () {},
                            ),
                          ),
                          OptionListTile(
                            title: "Add Shipping method",
                            subtitle: "Shipping Methods",
                            trailing: IconButton(
                              icon: Image.asset("assets/arrowright2.png"),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom fixed section
                  Column(
                    children: [
                      CheckoutPriceList(),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 52,
                        width: double.infinity,
                        child: CustomeElevatedButton(
                          buttonColor: appbarSec,
                          hintText: "Place Order",
                          textColor: Colors.white,
                          callbackFunction: () {
                            context.read<CartCubit>().clearCart();
                            context.pushReplacement("/purSuccess");
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            // Empty cart
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/noCart.png"),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      "Your cart is empty",
                      style: TextStyle(
                        fontSize: kNoTextSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 52,
                    width: double.infinity,
                    child: CustomeElevatedButton(
                      buttonColor: appbarSec,
                      hintText: "Explore Categories",
                      textColor: Colors.white,
                      callbackFunction: () {
                        context.push('/search');
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

/*
 callbackFunction: () {
                          context.read<CartCubit>().clearCart();
                          context.pushReplacement("/purSuccess");
                        },
 */
