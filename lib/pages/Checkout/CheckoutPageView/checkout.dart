import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:ecomflutter/pages/PaymentScreens/payment_view.dart';
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
                          "Checkout",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children:
                      value.selectedElements.entries.map((item) {
                        final product = item.key;
                        final quantity = item.value;

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
                                  "${product.price * item.value}\$",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
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
                                      child: SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: MaterialButton(
                                          color: appbarSec,
                                          onPressed: () {
                                            value.addElementToCart(product);
                                          },
                                          child: Image.asset("assets/add.png"),
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        kExtremeRaduis,
                                      ),
                                      child: SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: MaterialButton(
                                          color: appbarSec,
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
                SizedBox(
                  height: 52,
                  width: 195,
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