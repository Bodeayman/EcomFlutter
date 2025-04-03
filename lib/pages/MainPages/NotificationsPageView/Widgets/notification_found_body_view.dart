import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationFoundBodyView extends StatelessWidget {
  const NotificationFoundBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),

        Text("Notifications"),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              OptionListTile(
                leading: Icon(Icons.notification_add),
                title:
                    "Gilbert, you placed and order check your order history for full details",
              ),
              OptionListTile(
                leading: Icon(Icons.notification_add),
                title:
                    "Gilbert, you placed and order check your order history for full details",
              ),
              OptionListTile(
                leading: Icon(Icons.notification_add),
                title:
                    "Gilbert, you placed and order check your order history for full details",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
