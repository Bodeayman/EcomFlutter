import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class SwitchTile extends StatefulWidget {
  const SwitchTile({super.key});

  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  var isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        'Push Notifications',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      value: isSwitched,
      onChanged: (bool value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeColor: Colors.white,
      activeTrackColor: Colors.purple[700],
      inactiveThumbColor: Colors.purple[800],
      inactiveTrackColor: Colors.purple[300],
      secondary: Icon(Icons.notification_add, color: appbarSec),
    );
  }
}
