import 'package:ecomflutter/Features/CategoriesPage/Presentation/Views/category_view.dart';
import 'package:ecomflutter/Features/CheckoutPage/SuccessPageView/success_view.dart';
import 'package:ecomflutter/Features/DetailsPage/details.dart';
import 'package:ecomflutter/Features/HomePage/Data/Models/item.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/View/home_view.dart';
import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Views/cart.dart';
import 'package:ecomflutter/Features/OnBoardingPage/create_new_account_view.dart';
import 'package:ecomflutter/Features/OnBoardingPage/initial_sign_view.dart';
import 'package:ecomflutter/Features/OnBoardingPage/splash_view.dart';
import 'package:ecomflutter/Features/RecordsPage/record_view.dart';
import 'package:ecomflutter/Features/SearchPage/search_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(path: "/records", builder: (context, state) => RecordView()),
    GoRoute(path: "/", builder: (context, state) => SplashView()),
    GoRoute(path: "/home", builder: (context, state) => Home(current: 0)),

    GoRoute(path: "/orders", builder: (context, state) => Home(current: 2)),

    // GoRoute(path: "/details/:id", builder: (context, state) => Details(item: ,)),
    GoRoute(path: "/initial", builder: (context, state) => InitialSignView()),
    GoRoute(
      path: "/initialE",
      builder: (context, state) => CreateNewAccountView(),
    ),
    GoRoute(path: "/search", builder: (context, state) => SearchView()),
    GoRoute(
      path: '/categories/:name',
      builder: (context, state) {
        final String categoryName = state.pathParameters['name']!;
        return CategoryView(categoryName: categoryName);
      },
    ),

    GoRoute(
      path: "/cart",
      pageBuilder:
          (context, state) => CustomTransitionPage(
            child: CartPage(),
            key: state.pageKey,
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final curvedAnimation = CurvedAnimation(
                curve: Curves.easeInOut,
                parent: animation,
              );
              final secondaryCurvedAnimation = CurvedAnimation(
                curve: Curves.easeInOut,
                parent: secondaryAnimation,
              );
              final slideIn = Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset.zero,
              ).animate(curvedAnimation);
              final slideOut = Tween<Offset>(
                end: Offset(-0.3, 0),
                begin: Offset.zero,
              ).animate(secondaryCurvedAnimation);
              return SlideTransition(
                position: slideIn,
                child: SlideTransition(position: slideOut, child: child),
              );
            },
          ),
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
