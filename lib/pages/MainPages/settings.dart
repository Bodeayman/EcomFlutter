import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/MainPages/Widgets/settings_list_tile.dart';
import 'package:ecomflutter/pages/MainPages/Widgets/switch_tile.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            SwitchTile(),
            SizedBox(height: 10),
            SettingsListTile(
              subtitle: "Change your payment method from here",
              title: "Payment Methods",
              icon: Icon(Icons.credit_card, color: appbarSec),
              onTap: () {},
            ),

            SizedBox(height: 10),
            SettingsListTile(
              subtitle: "Edit your profile , password ,username",
              title: "Edit profile",
              icon: Icon(Icons.person, color: appbarSec),
              onTap: () {},
            ),
            SizedBox(height: 10),

            SettingsListTile(
              subtitle: "Switch between dark and white",
              title: "Change Theme",
              icon: Icon(Icons.nightlight_round_sharp, color: appbarSec),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
