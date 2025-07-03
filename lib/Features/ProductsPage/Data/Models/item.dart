import 'package:ecomflutter/Features/ProductsPage/Data/Models/color.dart';
import 'package:ecomflutter/Features/ProductsPage/Data/Models/size.dart';
import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String url;

  @HiveField(2)
  String description;

  @HiveField(3)
  double price;

  @HiveField(4)
  String location;

  @HiveField(5)
  String name;

  @HiveField(6)
  String cat;

  @HiveField(7)
  List<CustomerColor> colors;

  @HiveField(8)
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
