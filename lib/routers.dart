import 'package:ecomflutter/pages/Checkout/SuccessPageView/success_view.dart';
import 'package:ecomflutter/pages/Home/home_view.dart';
import 'package:ecomflutter/pages/Checkout/CheckoutPageView/checkout.dart';
import 'package:ecomflutter/pages/OnBoarding/create_new_account_view.dart';
import 'package:ecomflutter/pages/OnBoarding/initial_sign_view.dart';
import 'package:ecomflutter/pages/Records/record_view.dart';
import 'package:ecomflutter/pages/Search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/records", builder: (context, state) => RecordView()),
    GoRoute(path: "/", builder: (context, state) => Home()),
    GoRoute(path: "/initial", builder: (context, state) => InitialSignView()),
    GoRoute(
      path: "/initialE",
      builder: (context, state) => CreateNewAccountView(),
    ),
    GoRoute(path: "/search", builder: (context, state) => SearchView()),
    GoRoute(path: "/cart", builder: (context, state) => Checkout()),
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
