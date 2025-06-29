class NotificationModel {
  final int id;
  final String content;
  final DateTime deliveryDate;

  NotificationModel({
    required this.id,
    required this.content,
    required this.deliveryDate,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map["id"] ?? 0,
      content: map['content'] ?? '',
      deliveryDate: DateTime.parse(map['delivery_date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'delivery_date': deliveryDate.toIso8601String(),
    };
  }
}
