import 'package:ecomflutter/Features/CategoriesPage/Presentation/Views/category_view.dart';
import 'package:ecomflutter/Features/CheckoutPage/SuccessPageView/success_view.dart';
import 'package:ecomflutter/Features/HomePage/home_view.dart';
import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/cart.dart';
import 'package:ecomflutter/Features/OnBoardingPage/create_new_account_view.dart';
import 'package:ecomflutter/Features/OnBoardingPage/initial_sign_view.dart';
import 'package:ecomflutter/Features/RecordsPage/record_view.dart';
import 'package:ecomflutter/Features/SearchPage/search_view.dart';
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
    GoRoute(
      path: '/categories/:name',
      builder: (context, state) {
        final String categoryName = state.pathParameters['name']!;
        return CategoryView(categoryName: categoryName);
      },
    ),

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
