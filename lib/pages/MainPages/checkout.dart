import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/home.dart';
import 'package:ecomflutter/pages/MainPages/settings.dart';
import 'package:ecomflutter/shared/appbar.dart';
import 'package:flutter/cupertino.dart';
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
            Container(
              height: 20,
            ),
            const Text(
              "Checkout Page",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 20,
            ),
            SingleChildScrollView(
              child: Consumer<Cart>(
                builder: (context, value, child) {
                  return Column(
                    children: value.selectedElements.map((item) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          style: ListTileStyle.drawer,
                          tileColor: Colors.grey[200],
                          title: Text(item.name),
                          trailing: Image.network(
                            item.url,
                            fit: BoxFit.cover,
                          ),
                          subtitle: Text("${item.price}\$"),
                          leading: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              value.removeElement(item);
                            },
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Consumer<Cart>(builder: (context, value, child) {
              return ElevatedButton(
                onPressed: () {
                  if (value.selectedElements.isNotEmpty) {
                    while (value.selectedElements.isNotEmpty) {
                      value.removeElement(value.selectedElements.first);
                    }
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
                                        //To do : implement the gateway method here
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("Purchase Successful"),
                                          ),
                                        );
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
                                    const SizedBox(
                                      height: 50,
                                      width: 100,
                                    ),
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
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No elements found"),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: BTNpink),
                child: const Text(
                  "Buy",
                  style: TextStyle(color: Colors.white),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
