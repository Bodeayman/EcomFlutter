import 'package:ecomflutter/Features/CategoriesPage/Presentation/Views/category_view.dart';
import 'package:ecomflutter/Features/CheckoutPage/SuccessPageView/success_view.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/View/home_view.dart';
import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Views/cart.dart';
import 'package:ecomflutter/Features/OnBoardingPage/create_new_account_view.dart';
import 'package:ecomflutter/Features/OnBoardingPage/initial_sign_view.dart';
import 'package:ecomflutter/Features/OnBoardingPage/splash_view.dart';
import 'package:ecomflutter/Features/SearchPage/Widgets/search_found_results.dart';
import 'package:ecomflutter/Features/SearchPage/search_view.dart';
import 'package:ecomflutter/Features/DashboardPage/Presentation/Views/dashboard_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(path: "/", builder: (context, state) => SplashView()),
    GoRoute(
      path: "/home",
      builder: (context, state) => Home(current: 0),
    ), // Edit this line please

    GoRoute(path: "/orders", builder: (context, state) => Home(current: 2)),
    GoRoute(path: "/dashboard", builder: (context, state) => DashboardView()),

    // GoRoute(path: "/details/:id", builder: (context, state) => Details(item: ,)),
    GoRoute(path: "/initial", builder: (context, state) => InitialSignView()),
    GoRoute(
      path: "/initialE",
      builder: (context, state) => CreateNewAccountView(),
    ),
    // GoRoute(
    //   path: "/search",
    //   builder: (context, state) => SearchFoundResultsView(),
    // ),
    GoRoute(
      path: '/categories/:name',
      builder: (context, state) {
        final String categoryName = state.pathParameters['name']!;
        return CategoryView(categoryName: categoryName);
      },
    ),

    GoRoute(
      path: "/cart",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: CartPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );

            return Stack(
              children: [
                // Previous page gets a shadow and slides slightly left
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: Offset(-0.05, 0), // Slight push back
                  ).animate(secondaryAnimation),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),

                // New page slides in
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(curved),
                  child: child,
                ),
              ],
            );
          },
        );
      },
    ),
    GoRoute(
      path: "/purSuccess",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: SuccessView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
  ],
  initialLocation: "/",
);
