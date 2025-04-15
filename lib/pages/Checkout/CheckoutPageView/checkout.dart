import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/Checkout/CheckoutPageView/Widgets/checkout_price.dart';
import 'package:ecomflutter/pages/Checkout/CheckoutPageView/Widgets/enter_coupon_widget.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:flutter/material.dart';
import 'package:ecomflutter/provider/cart.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  double totalPriceCart = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Cart>(
        builder: (context, value, child) {
          if (value.selectedElements.isNotEmpty) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: InkWell(
                          onTap: () => {context.pop()},
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
                      ),
                      Expanded(
                        child: Text(
                          "Cart",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: value.clearCart,
                        child: Text(
                          "Remove all",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children:
                      value.selectedElements.entries.map((item) {
                        final product = item.key;

                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            style: ListTileStyle.drawer,
                            tileColor: Colors.grey[200],
                            title: Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("Size-M Color-L"),
                            leading: Image.network(
                              product.url,
                              fit: BoxFit.cover,
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${product.price * item.value}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                /////////////////
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        kExtremeRaduis,
                                      ),
                                      child: Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          color: appbarSec,
                                        ),
                                        child: RawMaterialButton(
                                          onPressed: () {
                                            value.addElementToCart(product);
                                          },
                                          child: Image.asset("assets/add.png"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        kExtremeRaduis,
                                      ),
                                      child: Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          color: appbarSec,
                                        ),
                                        child: RawMaterialButton(
                                          onPressed: () {
                                            value.removeElementFromCart(
                                              product,
                                            );
                                          },
                                          child: Image.asset(
                                            "assets/minus.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            contentPadding: const EdgeInsets.all(20),
                          ),
                        );
                      }).toList(),
                ),
                CheckoutPriceList(),
                EnterCouponWidget(),

                const SizedBox(height: 50),
                SizedBox(
                  height: 52,
                  child: CustomeElevatedButton(
                    buttonColor: appbarSec,
                    hintText: "Checkout",
                    textColor: Colors.white,
                    callbackFunction: () {
                      value.clearCart();

                      context.pushReplacement("/purSuccess");
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Column(
                    children: [
                      Image.asset("assets/noCart.png"),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 24),
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
                        width: 195,
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
   Consumer<Cart>(
              builder: (context, value, child) {
                if (value.selectedElements.isNotEmpty) {

                } else {
                 
                }
              },
            ),
 */