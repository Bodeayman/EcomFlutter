import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderRequestRepo {
  final _client = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getAllUserOrders() async {
    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        throw Exception("No user is logged in");
      }

      final response = await _client
          .from('Orders')
          .select()
          .eq('user_id', user.id);

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<void> addNewOrder() async {
    final user = _client.auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    final now = DateTime.now();
    final orderConfirmed = now.toIso8601String();
    final orderShipped = now.add(Duration(days: 2)).toIso8601String();
    final shippedDate = now.add(Duration(days: 4)).toIso8601String();
    final deliveryDate = now.add(Duration(days: 6)).toIso8601String();
    try {
      final response =
          await _client.from('Orders').insert({
            'user_id': user.id,
            'order_confirmed': orderConfirmed,
            'order_shipped': orderShipped,
            'shipped_date': shippedDate,
            'delivery_date': deliveryDate,
            'address': 'Cairo',
          }).select();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
