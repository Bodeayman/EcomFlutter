import 'package:hive/hive.dart';

part 'dashboard_product.g.dart';

@HiveType(typeId: 10)
class DashboardProduct extends HiveObject {
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
  int quantity;

  DashboardProduct({
    required this.id,
    required this.url,
    required this.description,
    required this.price,
    required this.location,
    required this.name,
    required this.cat,
    required this.quantity,
  });

  factory DashboardProduct.fromMap(Map<String, dynamic> map) {
    return DashboardProduct(
      id: map['id'],
      url: map['url'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      location: map['location'] ?? 'Cairo',
      name: map['name'] ?? '',
      cat: map['cat'] ?? '',
      quantity: map['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'description': description,
      'price': price,
      'location': location,
      'name': name,
      'cat': cat,
      'quantity': quantity,
    };
  }
}
