import 'package:hive/hive.dart';

part 'notificationModel.g.dart';

@HiveType(typeId: 3)
class NotificationModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String content;
  @HiveField(2)
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
