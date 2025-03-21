import 'package:ecomflutter/pages/Home/home_view.dart';
import 'package:ecomflutter/pages/Login/login.dart';
import 'package:ecomflutter/pages/Records/record_view.dart';
import 'package:flutter/material.dart';

void GoToRecords(BuildContext context) {
  Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => RecordView()));
}

void Logout(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Logging out...."),
      duration: Duration(milliseconds: 500),
    ),
  );
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
}

void GoToSettings(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
}

void GoToProducts(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
}

void GoToHelp(BuildContext context) {
  Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => RecordView()));
}
