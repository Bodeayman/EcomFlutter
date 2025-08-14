import 'package:ecomflutter/Features/ProductsPage/Data/Models/item.dart';
import 'package:ecomflutter/Features/OrdersPage/Data/Models/order.dart';
import 'package:ecomflutter/utils/usefulFunctions.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderRequestRepo {
  final _client = Supabase.instance.client;

  Future<List<OrderModel>> getAllUserOrders() async {
    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        throw Exception("No user is logged in");
      }
      final ordersBox = Hive.box<OrderModel>('allOrders');
      final connected = await isConnected();
      if (!connected) {
        final cachedItems = ordersBox.values.toList();
        if (cachedItems.isNotEmpty) {
          debugPrint("Returned cached data from Hive");
          return (cachedItems);
        }
      }
      final response = await _client
          .from('Orders')
          .select('*, Orders_items(*)')
          .eq('user_id', user.id)
          .timeout(Duration(seconds: 15));

      List<OrderModel> allOrders =
          (response as List).map((item) => OrderModel.fromMap(item)).toList();
      await ordersBox.clear();
      await ordersBox.addAll(allOrders);
      return allOrders;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<void> addNewOrder(Map<Item, int> productsInCart) async {
    final user = _client.auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    final now = DateTime.now();
    // it should be admin request
    final orderConfirmed = now.toIso8601String();
    final orderShipped = now.add(Duration(hours: 2)).toIso8601String();
    final shippedDate = now.add(Duration(hours: 4)).toIso8601String();
    final deliveryDate = now.add(Duration(hours: 6)).toIso8601String();
    try {
      final newOrder =
          await _client.from('Orders').insert({
            'user_id': user.id,
            'order_confirmed': orderConfirmed,
            'order_shipped': orderShipped,
            'shipped_date': shippedDate,
            'delivery_date': deliveryDate,
            'address': 'Cairo',
          }).select();

      await Future.wait(
        productsInCart.entries.map((entry) {
          return _client.from('Orders_items').insert({
            'order_id': newOrder.first['id'],
            'item_id': entry.key.id,
            'quantity': entry.value,
          });
        }),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteOrder(int id) async {
    final user = _client.auth.currentUser;
    debugPrint("Deleting now $id");

    if (user == null) {
      throw Exception("User not logged in");
    }
    try {
      print("Deleting Order with ID: $id");

      await _client.from('Orders').delete().eq('id', id);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addNewOrderItemsForOrder() async {}

  Future<List<int>> fetchOrderProducts(int id) async {
    final response = await Supabase.instance.client
        .from("Orders_items")
        .select("item_id")
        .eq("order_id", id);
    List<int> productIds =
        response
            .map<int>(
              (item) =>
                  item['item_id'] is int
                      ? item['item_id']
                      : int.parse(item['item_id'].toString()),
            )
            .toList();
    return productIds;
  }
}
