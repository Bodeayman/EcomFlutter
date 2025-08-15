import 'package:hive/hive.dart';

part 'dashboard_order.g.dart';

@HiveType(typeId: 11)
class DashboardOrder extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String address;

  @HiveField(2)
  String userId;

  @HiveField(3)
  String status;

  @HiveField(4)
  DateTime? shippedDate;

  @HiveField(5)
  DateTime? deliveryDate;

  @HiveField(6)
  DateTime? orderConfirmed;

  DashboardOrder({
    required this.id,
    required this.address,
    required this.userId,
    required this.status,
    this.shippedDate,
    this.deliveryDate,
    this.orderConfirmed,
  });

  factory DashboardOrder.fromMap(Map<String, dynamic> map) {
    return DashboardOrder(
      id: map['id'],
      address: map['address'] ?? '',
      userId: map['user_id'] ?? 0,
      status: map['status'] ?? 'pending',
      shippedDate:
          map['shipped_date'] != null
              ? DateTime.parse(map['shipped_date'])
              : null,
      deliveryDate:
          map['delivery_date'] != null
              ? DateTime.parse(map['delivery_date'])
              : null,
      orderConfirmed:
          map['approved_date'] != null
              ? DateTime.parse(map['approved_date'])
              : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'user_id': userId,
      'status': status,
      'shipped_date': shippedDate?.toIso8601String(),
      'delivery_date': deliveryDate?.toIso8601String(),
      'order_confirmed': orderConfirmed?.toIso8601String(),
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
