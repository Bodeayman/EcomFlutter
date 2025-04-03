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
    this.tileBorder,
  });
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final Widget? leading;
  final double? tileBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),

      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius:
              (tileBorder != null)
                  ? BorderRadius.circular(tileBorder!)
                  : BorderRadius.circular(kSettingsTile),
        ),
        tileColor: kTextForm,
        title: (title != null) ? Text(title!) : null,
        trailing: (trailing != null) ? trailing : null,
        subtitle: (subtitle != null) ? Text(subtitle!) : null,
        leading: (leading != null) ? leading : null,
      ),
    );
  }
}
