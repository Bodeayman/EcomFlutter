import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/MainPages/notifications.dart';
import 'package:ecomflutter/pages/MainPages/orders.dart';
import 'package:ecomflutter/shared/appbar.dart';
import 'package:ecomflutter/shared/home_drawer.dart';
import 'package:ecomflutter/pages/MainPages/checkout.dart';
import 'package:ecomflutter/pages/MainPages/products.dart';
import 'package:ecomflutter/pages/MainPages/profilePage.dart';
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
        children: const [
          ProductsPage(),
          NotificationsPage(),
          OrdersPage(),
          ProfilePage(),
        ],
      ),

      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: Material(
              color: Colors.white, // or your desired background color
              elevation: 0, // Zero elevation to remove any shadow
              child: BottomNavigationBar(
                selectedItemColor: appbarSec,

                unselectedItemColor: Colors.grey.shade600, //
                showUnselectedLabels: false, // Show labels for all items
                type: BottomNavigationBarType.fixed, // Prevents shifting
                selectedFontSize: 0, // Larger text
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
                    label: "*",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/notificationsButton.png"),
                    label: "*",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/ordersButton.png"),
                    label: "*",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/profileButton.png",
                      color: Colors.grey,
                    ),
                    label: "*",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
