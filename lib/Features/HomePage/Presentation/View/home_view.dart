import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/Manager/main_products_cubit.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/View/Widgets/MainPages/NotificationsPageView/notifications.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/View/Widgets/MainPages/OrdersViewPage/orders.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/View/Widgets/MainPages/ProductsPageView/products.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/View/Widgets/MainPages/ProfilePageView/profilePage.dart';
import 'package:ecomflutter/utils/usefulFunctions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.current});
  final int current;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late StreamSubscription<ConnectivityResult> _connectionSubscription;
  int productNeeded = 0;
  int totalPrice = 0;
  int currentIndex = 0;
  late final PageController _pageController = PageController(
    initialPage: widget.current,
  );
  @override
  void initState() {
    super.initState();
    _connectionSubscription = Connectivity().onConnectivityChanged.listen((
      ConnectivityResult result,
    ) {
      final isOnline = result != ConnectivityResult.none;
      if (isOnline) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.success(message: "The connection has came back"),
        );
        context.read<MainProductsCubit>().loadItems();
      } else {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.info(message: "No Internect Connection"),
        );
      }
    });
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
              color: Colors.white,
              elevation: 0,
              child: BottomNavigationBar(
                selectedItemColor: appbarSec,

                unselectedItemColor: Colors.grey.shade600, //
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 0,
                elevation: 0,
                unselectedFontSize: 12,
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
