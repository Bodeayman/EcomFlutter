import 'package:hive/hive.dart';
part 'orderItem.g.dart';

@HiveType(typeId: 5)
class OrderItem extends HiveObject {
  @HiveField(0)
  final int itemId;
  @HiveField(1)
  final int quantity;

  OrderItem({required this.itemId, required this.quantity});

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(itemId: map['item_id'], quantity: map['quantity']);
  }
}
