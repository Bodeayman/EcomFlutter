import 'package:ecomflutter/model/item.dart';

class Order {
  int id;
  // double price;
  // List<Item> items;
  String location;
  String date;
  Order(this.id, this.location, this.date);
}
