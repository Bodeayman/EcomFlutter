class OrderItem {
  final int itemId;
  final int quantity;

  OrderItem({required this.itemId, required this.quantity});

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(itemId: map['item_id'], quantity: map['quantity']);
  }
}
