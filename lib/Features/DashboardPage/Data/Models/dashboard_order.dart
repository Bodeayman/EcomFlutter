import 'package:hive/hive.dart';

part 'dashboard_order.g.dart';

@HiveType(typeId: 11)
class DashboardOrder extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String address;

  @HiveField(2)
  int userId;

  @HiveField(3)
  DateTime? shippedDate;

  @HiveField(4)
  DateTime? deliveryDate;

  @HiveField(5)
  bool orderConfirmed;

  @HiveField(6)
  bool orderShipped;

  DashboardOrder({
    required this.id,
    required this.address,
    required this.userId,
    this.shippedDate,
    this.deliveryDate,
    this.orderConfirmed = false,
    this.orderShipped = false,
  });

  factory DashboardOrder.fromMap(Map<String, dynamic> map) {
    return DashboardOrder(
      id: map['id'],
      address: map['address'] ?? '',
      userId: map['user_id'] ?? 0,
      shippedDate:
          map['shipped_date'] != null
              ? DateTime.parse(map['shipped_date'])
              : null,
      deliveryDate:
          map['delivery_date'] != null
              ? DateTime.parse(map['delivery_date'])
              : null,
      orderConfirmed: map['order_confirmed'] ?? false,
      orderShipped: map['order_shipped'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'user_id': userId,
      'shipped_date': shippedDate?.toIso8601String(),
      'delivery_date': deliveryDate?.toIso8601String(),
      'order_confirmed': orderConfirmed,
      'order_shipped': orderShipped,
    };
  }
}

@HiveType(typeId: 15) // Make sure this typeId is unique across all your models
class DashboardOrderItem extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String orderId;

  @HiveField(2)
  final String itemId;

  @HiveField(3)
  final int quantity;

  DashboardOrderItem({
    required this.id,
    required this.orderId,
    required this.itemId,
    required this.quantity,
  });

  /// Convert a Map to an OrderItem instance
  factory DashboardOrderItem.fromMap(Map<String, dynamic> map) {
    return DashboardOrderItem(
      id: map['id'] as String,
      orderId: map['order_id'] as String,
      itemId: map['item_id'] as String,
      quantity: map['quantity'] as int,
    );
  }

  /// Convert an OrderItem instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'order_id': orderId,
      'item_id': itemId,
      'quantity': quantity,
    };
  }
}
