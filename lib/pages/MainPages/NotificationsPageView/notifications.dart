import 'dart:math';

import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/MainPages/NotificationsPageView/Widgets/notification_found_body_view.dart';
import 'package:ecomflutter/pages/MainPages/NotificationsPageView/Widgets/notification_notFound_body_view.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Random().nextBool()
              ? NotificationNotfoundBodyView()
              : NotificationFoundBodyView(),
    );
  }
}
