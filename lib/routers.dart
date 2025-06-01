import 'package:ecomflutter/Features/Checkout/SuccessPageView/success_view.dart';
import 'package:ecomflutter/Features/Home/home_view.dart';
import 'package:ecomflutter/Features/Checkout/CheckoutPageView/cart.dart';
import 'package:ecomflutter/Features/OnBoarding/create_new_account_view.dart';
import 'package:ecomflutter/Features/OnBoarding/initial_sign_view.dart';
import 'package:ecomflutter/Features/Records/record_view.dart';
import 'package:ecomflutter/Features/Search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/records", builder: (context, state) => RecordView()),
    GoRoute(path: "/", builder: (context, state) => InitialSignView()),
    GoRoute(path: "/home", builder: (context, state) => Home(current: 0)),

    GoRoute(path: "/orders", builder: (context, state) => Home(current: 2)),

    GoRoute(path: "/initial", builder: (context, state) => InitialSignView()),
    GoRoute(
      path: "/initialE",
      builder: (context, state) => CreateNewAccountView(),
    ),
    GoRoute(path: "/search", builder: (context, state) => SearchView()),
    GoRoute(path: "/cart", builder: (context, state) => CartPage()),
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
