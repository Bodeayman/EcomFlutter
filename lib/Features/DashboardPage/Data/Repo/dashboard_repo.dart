import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Models/dashboard_product.dart';
import '../Models/dashboard_order.dart';
import '../Models/dashboard_user.dart';

class DashboardRepo {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<DashboardProduct>> getAllProducts() async {
    try {
      final response = await _supabase.from('Products').select();
      return (response as List)
          .map((product) => DashboardProduct.fromMap(product))
          .toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  Future<DashboardProduct> createProduct(DashboardProduct product) async {
    try {
      final response =
          await _supabase
              .from('Products')
              .insert(product.toMap())
              .select()
              .single();

      return DashboardProduct.fromMap(response);
    } catch (e) {
      print('Error creating product: $e');
      throw Exception('Failed to create product: $e');
    }
  }

  Future<DashboardProduct> updateProduct(DashboardProduct product) async {
    try {
      final response =
          await _supabase
              .from('Products')
              .update(product.toMap())
              .eq('id', product.id)
              .select()
              .single();

      return DashboardProduct.fromMap(response);
    } catch (e) {
      print('Error updating product: $e');
      throw Exception('Failed to update product: $e');
    }
  }

  Future<void> deleteProduct(int productId) async {
    try {
      await _supabase.from('Products').delete().eq('id', productId);
    } catch (e) {
      print('Error deleting product: $e');
      throw Exception('Failed to delete product: $e');
    }
  }

  Future<List<DashboardOrder>> getAllOrders() async {
    try {
      final response = await _supabase
          .from('Orders')
          .select('*, Orders_items(*)');
      return (response as List)
          .map((order) => DashboardOrder.fromMap(order))
          .toList();
    } catch (e) {
      print('Error fetching orders: $e');
      return [];
    }
  }

  Future<List<DashboardOrder>> getOrdersByStatus(String status) async {
    try {
      final response = await _supabase
          .from('Orders')
          .select('*, Orders_items(*)');
      return (response as List)
          .map((order) => DashboardOrder.fromMap(order))
          .toList();
    } catch (e) {
      print('Error fetching orders by status: $e');
      return [];
    }
  }

  Future<DashboardOrder> updateOrderStatus(int orderId, String status) async {
    try {
      Map<String, dynamic> updateData = {'status': status};

      switch (status) {
        case 'approved':
          updateData['order_confirmed'] = DateTime.now().toIso8601String();
          break;
        case 'shipped':
          updateData['shipped_date'] = DateTime.now().toIso8601String();
          break;
        case 'delivered':
          updateData['delivered_date'] = DateTime.now().toIso8601String();
          break;
      }

      final response =
          await _supabase
              .from('Orders')
              .update(updateData)
              .eq('id', orderId)
              .select('*, Orders_items(*)')
              .single();

      return DashboardOrder.fromMap(response);
    } catch (e) {
      print('Error updating order status: $e');
      throw Exception('Failed to update order status: $e');
    }
  }

  Future<List<DashboardUser>> getAllUsers() async {
    try {
      final response = await _supabase.from('Users').select();

      return (response as List)
          .map((user) => DashboardUser.fromMap(user))
          .toList();
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _supabase.from('Users').delete().eq('auth_id', userId);
    } catch (e) {
      print('Error deleting user: $e');
      throw Exception('Failed to delete user: $e');
    }
  }

  Future<DashboardUser> updateUserRole(String userId, String role) async {
    try {
      final response =
          await _supabase
              .from('Users')
              .update({'role': role})
              .eq('auth_id', userId)
              .select()
              .single();

      return DashboardUser.fromMap(response);
    } catch (e) {
      print('Error updating user role: $e');
      throw Exception('Failed to update user role: $e');
    }
  }

  Future<Map<String, dynamic>> getDashboardStats() async {
    try {
      final productsResponse = await _supabase.from('Products').select('id');
      final ordersResponse = await _supabase.from('Orders').select('id');
      final pendingOrdersResponse = await _supabase
          .from('Orders')
          .select('id')
          .eq('status', 'pending');
      final usersResponse = await _supabase.from('Users').select('auth_id');

      final productsCount = productsResponse.length ?? 0;
      final ordersCount = ordersResponse.length ?? 0;
      final pendingOrdersCount = pendingOrdersResponse.length ?? 0;
      final usersCount = usersResponse.length ?? 0;

      return {
        'totalProducts': productsCount,
        'totalOrders': ordersCount,
        'pendingOrders': pendingOrdersCount,
        'totalUsers': usersCount,
      };
    } catch (e) {
      print('Error fetching dashboard stats: $e');
      return {
        'totalProducts': 0,
        'totalOrders': 0,
        'pendingOrders': 0,
        'totalUsers': 0,
      };
    }
  }

  Future<bool> hasDashboardAccess(String userId) async {
    try {
      final response =
          await _supabase
              .from('Users')
              .select('role')
              .eq('auth_id', userId)
              .single();

      return response['role'] == 'dashboard' || response['role'] == 'admin';
    } catch (e) {
      print('Error checking dashboard access: $e');
      return false;
    }
  }
}
