import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:flutter/material.dart';

class OptionListTile extends StatelessWidget {
  const OptionListTile({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
  });
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(kSettingsTile),
        child: ListTile(
          tileColor: kTextForm,
          title: (title != null) ? Text(title!) : null,
          trailing: (trailing != null) ? trailing : null,
          subtitle: (subtitle != null) ? Text(subtitle!) : null,
          leading: (leading != null) ? leading : null,
        ),
      ),
    );
  }
}
