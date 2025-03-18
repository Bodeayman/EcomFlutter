import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/model/item.dart';
import 'package:ecomflutter/pages/MainPages/Widgets/Switch_tile.dart';
import 'package:ecomflutter/pages/MainPages/checkout.dart';
import 'package:ecomflutter/pages/Home/home_view.dart';
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
    return const Scaffold(
      body: SingleChildScrollView(child: Column(children: [SwitchTile()])),
    );
  }
}
