import 'package:ecomflutter/pages/Records/record_view.dart';
import 'package:flutter/material.dart';

class ListSetting extends StatelessWidget {
  String hint_list;
  Icon my_icon;
  ListSetting({super.key, required this.hint_list, required this.my_icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const RecordView(),
          ),
        );
      },
      child: ListTile(
        leading: my_icon,
        title: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            hint_list,
          ),
        ),
      ),
    );
  }
}
