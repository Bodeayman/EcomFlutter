import 'package:ecomflutter/pages/MainPages/checkout.dart';
import 'package:ecomflutter/pages/MainPages/settings.dart';
import 'package:ecomflutter/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/home.dart';
import 'package:ecomflutter/model/item.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

//Pass the values of the object to the details page
// if you have var inside the stateful widget the parent , then you will need a widget var to access the details
// ignore: must_be_immutable
class Details extends StatefulWidget {
  Details({super.key, required this.item});
  Item item;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool show_text = true;

  @override
  Widget build(BuildContext context) {
    //Passing data is the worst thing in flutter , we should take notes about it
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-com"),
        backgroundColor: appbarSec,
        leading: IconButton(
          icon: const Icon(Icons.subdirectory_arrow_left_outlined),
          onPressed: () {
            Navigator.pushReplacement(
              (context),
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          },
        ),
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            (context),
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        },
                        padding: const EdgeInsets.only(right: 8, top: 15),
                        icon: const Icon(Icons.shopping_cart, size: 30),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: BTNpink,
                        ),
                        child: Text(
                          "${value.selectedElements.length}",
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: Text(
                      "${value.total_Price}\$",
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Details Page"),
            const SizedBox(height: 11),
            Image.network(
              widget.item.url,
              fit: BoxFit.contain,
            ),
            Text("${widget.item.price}"),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  // The big row
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("New"),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.place, color: Colors.green),
                    Text(widget.item.location),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Details",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.start,
                //Doesn't work alone in the star
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                """I actually love playing with flutter and the freelancing jobs , i don't
know what should i do , the products and the things i do is useless , most of the 
people see me as amateur , and I'm fighting a long life that i don't know what should
i do if i didn't go on it , i should fight , there's nothing in my way """,
                style: const TextStyle(fontSize: 21),
                maxLines: show_text ? 1 : null,
                overflow: TextOverflow.fade,
                //Fade is for the overflow , and the fade is to hide part of this shit
                //maxLines is great
              ),
            ),
            //Color is in the container which will give the opp. to give color to the text
            TextButton(
                onPressed: () {
                  //maxLines : null -> as maxLines not writtin
                  setState(() {
                    show_text = !show_text;
                  });
                },
                child: show_text
                    ? const Text("Show More")
                    : const Text("Show less"))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: 0,
        onTap: (val) {
          if (val == 0) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Home()));
          } else if (val == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Checkout(),
              ),
            );
          } else if (val == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Settings(),
              ),
            );
          }
        },
      ),
    );
  }
}
