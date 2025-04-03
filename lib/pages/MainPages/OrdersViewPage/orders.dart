import 'dart:math';

import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/MainPages/OrdersViewPage/Widgets/orders_found_view_body.dart';
import 'package:ecomflutter/pages/MainPages/OrdersViewPage/Widgets/orders_not_found_view_body.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Random().nextBool()
              ? OrdersNotFoundViewBody()
              : OrdersFoundViewBody(),
    );
  }
}


/*
     
 */