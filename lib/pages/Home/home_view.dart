import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/MainPages/NotificationsPageView/notifications.dart';
import 'package:ecomflutter/pages/MainPages/OrdersViewPage/orders.dart';
import 'package:ecomflutter/pages/MainPages/ProductsPageView/products.dart';
import 'package:ecomflutter/pages/MainPages/ProfilePageView/profilePage.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.current});
  final int current;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int productNeeded = 0;
  int totalPrice = 0;
  int currentIndex = 0;
  late final PageController _pageController = PageController(
    initialPage: widget.current,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: const [
            ProductsPage(),
            NotificationsPage(),
            OrdersPage(),
            ProfilePage(),
          ],
        ),
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
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },

                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/homePageButton.png",
                      color:
                          (currentIndex == 0)
                              ? Colors.purple
                              : Colors.grey.shade600,
                    ),
                    label: "*",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/notificationsButton.png",
                      color:
                          (currentIndex == 1)
                              ? Colors.purple
                              : Colors.grey.shade600,
                    ),
                    label: "*",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/ordersButton.png",
                      color:
                          (currentIndex == 2)
                              ? Colors.purple
                              : Colors.grey.shade600,
                    ),
                    label: "*",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/profileButton.png",
                      color:
                          (currentIndex == 3)
                              ? Colors.purple
                              : Colors.grey.shade600,
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
