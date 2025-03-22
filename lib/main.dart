import 'package:ecomflutter/model/item.dart';
import 'package:ecomflutter/pages/Register/register.dart';
import 'package:ecomflutter/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    addItemsToList("https://fakestoreapi.com/products");
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
        home: Register(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
