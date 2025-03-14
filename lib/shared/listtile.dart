import 'package:flutter/material.dart';

class ListSetting extends StatelessWidget {
  String hint_list;
  Icon my_icon;
  ListSetting({Key? key, required this.hint_list, required this.my_icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: my_icon,
        title: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            hint_list,
          ),
        ),
      ),
    );
  }
}
