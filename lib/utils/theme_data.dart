import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Circularstd",
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[600],
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
    fontFamily: "Circularstd",
  ),
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    ),
  ),
  iconTheme: IconThemeData(color: Colors.black),
  primarySwatch: Colors.deepPurple,
);
