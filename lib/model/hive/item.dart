import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 1)
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

  Item({
    required this.id,
    required this.url,
    required this.description,
    required this.price,
    required this.location,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
