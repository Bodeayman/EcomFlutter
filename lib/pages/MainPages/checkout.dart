import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ecomflutter/provider/cart.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(height: 20),
            // const Text(
            //   "Checkout Page",
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            Container(height: 20),
            SingleChildScrollView(
              child: Consumer<Cart>(
                builder: (context, value, child) {
                  return Column(
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
                                "${product.name} (x$quantity)",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ), // Shows item name + count
                              trailing: Image.network(
                                product.url,
                                fit: BoxFit.cover,
                              ),
                              subtitle: Text("${product.price}\$"),
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      value.removeElementFromCart(product);
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                              contentPadding: const EdgeInsets.all(20),
                            ),
                          );
                        }).toList(),
                  );
                },
              ),
            ),
            Consumer<Cart>(
              builder: (context, value, child) {
                if (value.selectedElements.isNotEmpty) {
                  return ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              width: 300,
                              height: 200,
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Payment Method',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          value.clearCart();
                                          Navigator.of(context).pop();

                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Purchase Successful",
                                              ),
                                            ),
                                          );
                                          value.totalPrice = 0;
                                        },
                                        child: SizedBox(
                                          height: 50,
                                          width: 100,
                                          child: Image.asset(
                                            "assets/img/stripe.png",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 50, width: 100),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: btnPink),
                    child: const Text(
                      "Buy",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return Center(child: Text("No elements in the cart"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
