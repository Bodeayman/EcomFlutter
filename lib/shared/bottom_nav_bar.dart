import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _current_index = 0;
  late PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _current_index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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

              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/profileButton.png"),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
