import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListSetting extends StatelessWidget {
  String hintList;
  Icon myIcon;
  final void Function(BuildContext context) onPressFunc;
  ListSetting({
    super.key,
    required this.hintList,
    required this.myIcon,
    required this.onPressFunc,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressFunc(context),
      child: ListTile(
        leading: myIcon,
        title: Container(
          padding: const EdgeInsets.all(15),
          child: Text(hintList),
        ),
      ),
    );
  }
}
