import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/shared/appbar.dart';
import 'package:ecomflutter/shared/home_drawer.dart';
import 'package:ecomflutter/pages/MainPages/checkout.dart';
import 'package:ecomflutter/pages/MainPages/products.dart';
import 'package:ecomflutter/pages/MainPages/settings.dart';
import 'package:ecomflutter/provider/cart.dart';

import 'package:flutter/material.dart';
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
  int productNeeded = 0;
  int totalPrice = 0;
  int current_index = 0;
  late PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: current_index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            current_index = index;
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
          child: Material(
            color: Colors.white, // or your desired background color
            elevation: 0, // Zero elevation to remove any shadow
            child: BottomNavigationBar(
              selectedItemColor: appbarSec, // Selected item color
              unselectedItemColor:
                  Colors.grey.shade600, // Unselected item color
              showUnselectedLabels: true, // Show labels for all items
              type: BottomNavigationBarType.fixed, // Prevents shifting
              selectedFontSize: 14, // Larger text
              elevation: 0, // No shadow here
              unselectedFontSize: 12, // Slightly smaller unselected text
              currentIndex: current_index,
              onTap: (index) {
                setState(() {
                  current_index = index;
                });
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset("assets/homePageButton.png"),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/notificationsButton.png"),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/ordersButton.png"),
                  label: "Orders",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/profileButton.png"),
                  label: "Settings",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
