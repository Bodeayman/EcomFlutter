import 'package:ecomflutter/model/item.dart';
import 'package:ecomflutter/pages/home.dart';
import 'package:ecomflutter/pages/Register/register.dart';
import 'package:ecomflutter/provider/cart.dart';
import 'package:flutter/material.dart';
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
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

      // routes: {
      //   '/login.dart': (context) => Login(),
      //   '/register.dart': (context) => Register(),
      //   //These are the routes of teh prograph
      // },
      //Useless