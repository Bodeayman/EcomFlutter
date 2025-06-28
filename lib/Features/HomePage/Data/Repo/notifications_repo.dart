import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationsRepo {
  final _client = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> notifyUsers() async {
    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        throw Exception("No user is logged in");
      }

      final response = await _client
          .from('Notifications')
          .select()
          .eq('user_id', user.id);

      // Return as list of maps
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
