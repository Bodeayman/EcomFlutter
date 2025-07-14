import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Views/cart.dart';
import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Manager/cart_cubit.dart';

void main() {
  testWidgets('displays "Your cart is empty" when no items in cart', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CartCubit>(
          create: (_) => CartCubit()..emit(CartInitial()),
          child: const CartPage(),
        ),
      ),
    );

    await tester.pumpAndSettle(); // make sure all frames are rendered

    expect(find.text('Hello there'), findsOneWidget);
  });
}
