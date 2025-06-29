import 'package:ecomflutter/Features/HomePage/Data/Models/color.dart';
import 'package:ecomflutter/Features/HomePage/Data/Models/size.dart';

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
