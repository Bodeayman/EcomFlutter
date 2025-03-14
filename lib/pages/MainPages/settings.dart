import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/model/item.dart';
import 'package:ecomflutter/pages/MainPages/checkout.dart';
import 'package:ecomflutter/pages/home.dart';
import 'package:ecomflutter/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            const Center(
              child: Text("This is the settings sections"),
            ),
            MaterialButton(onPressed: () {}, child: Text("Debug here")),
          ],
        ),
      ),
    );
  }
}
