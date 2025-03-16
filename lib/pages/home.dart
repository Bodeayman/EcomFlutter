import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/shared/home_drawer.dart';
import 'package:ecomflutter/pages/MainPages/checkout.dart';
import 'package:ecomflutter/pages/MainPages/products.dart';
import 'package:ecomflutter/pages/MainPages/settings.dart';
import 'package:ecomflutter/provider/cart.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*
  Home({Key? key}) : super(key: key);
  Don't know what is the use of this shit
   */
  int product_needed = 0;
  int total_price = 0;
  int _current_index = 0;
  late PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _current_index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: const Text("JimTan"),
        backgroundColor: appbarSec,
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _current_index = 1;
                          });
                          _pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          // This is the responsible for the movement of the page
                          // Why I would I use chatgpt a lot
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _current_index = index;
          });
        },
        children: const [ProductsPage(), Checkout(), Settings()],
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12), // Adds spacing around the bar
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1), // Subtle shadow
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            backgroundColor: Colors.white, // Background color
            selectedItemColor: appbarSec, // Selected item color
            unselectedItemColor: Colors.grey.shade600, // Unselected item color
            showUnselectedLabels: true, // Show labels for all items
            type: BottomNavigationBarType.fixed, // Prevents shifting
            elevation: 0, // Removes default shadow
            selectedFontSize: 14, // Larger text
            unselectedFontSize: 12, // Slightly smaller unselected text
            currentIndex: _current_index,
            onTap: (index) {
              setState(() {
                _current_index = index;
              });
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 28), // Bigger icon
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, size: 28),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 28),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
