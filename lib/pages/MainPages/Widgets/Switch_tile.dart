import 'package:flutter/material.dart';

class SwitchTile extends StatefulWidget {
  const SwitchTile({super.key});

  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  var sw = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Push Notifications"),
      trailing: Switch(
        onChanged: (sw) => {sw = !sw},
        value: sw,
      ),
    );
  }
}
