import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Circularstd",
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
);
final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[600],
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
    fontFamily: "Circularstd",
  ),
  primarySwatch: Colors.deepPurple,
);
