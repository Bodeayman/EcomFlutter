import 'package:ecomflutter/Features/HomePage/Data/Models/color.dart';
import 'package:ecomflutter/Features/HomePage/Data/Models/size.dart';
import 'package:ecomflutter/utils/usefulFunctions.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Item {
  int id;
  String url;
  String description;
  double price;
  String location;
  String name;
  String cat;
  List<CustomerColor> colors;
  List<CustomerSize> sizes;

  Item({
    required this.id,
    required this.url,
    required this.description,
    required this.price,
    required this.location,
    required this.name,
    required this.cat,
    required this.colors,
    required this.sizes,
  });
}
