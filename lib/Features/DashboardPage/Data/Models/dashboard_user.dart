import 'package:hive/hive.dart';

part 'dashboard_user.g.dart';

@HiveType(typeId: 13)
class DashboardUser extends HiveObject {
  @HiveField(0)
  String authId; // Supabase Auth UUID

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String address;

  @HiveField(4)
  String role; // 'user', 'admin', 'dashboard'

  DashboardUser({
    required this.authId,
    required this.name,
    required this.email,
    required this.address,
    required this.role,
  });

  factory DashboardUser.fromMap(Map<String, dynamic> map) {
    return DashboardUser(
      authId: map['auth_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      role: map['role'] ?? 'user',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'auth_id': authId,
      'name': name,
      'email': email,
      'address': address,
      'role': role,
    };
  }
}
