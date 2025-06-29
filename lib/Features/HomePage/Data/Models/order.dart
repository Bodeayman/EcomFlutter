import 'package:ecomflutter/Features/HomePage/Data/Models/orderItem.dart';

class OrderModel {
  final int id;
  final String address;
  final DateTime orderConfirmed;
  final DateTime orderShipped;
  final DateTime shippedDate;
  final DateTime deliveryDate;
  final List<OrderItem> products;

  OrderModel({
    required this.id,
    required this.address,
    required this.orderConfirmed,
    required this.orderShipped,
    required this.shippedDate,
    required this.deliveryDate,
    required this.products,
  });

  // 🟢 Convert Supabase map to Dart object
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      address: map['address'] ?? '',
      orderConfirmed: DateTime.parse(map['order_confirmed']),
      orderShipped: DateTime.parse(map['order_shipped']),
      shippedDate: DateTime.parse(map['shipped_date']),
      deliveryDate: DateTime.parse(map['delivery_date']),
      products:
          (map['Orders_items'] as List<dynamic>)
              .map((item) => OrderItem.fromMap(item as Map<String, dynamic>))
              .toList(),
    );
  }
}
