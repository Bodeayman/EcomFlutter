import 'dart:convert';

import 'package:ecomflutter/model/item.dart';
import 'package:ecomflutter/model/order.dart';
import 'package:ecomflutter/model/rating.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Order>> getAllOrders() async {
  final response = await http.get(
    Uri.parse('http://localhost:5000/api/orders/1'),
  );
  List<dynamic> data = jsonDecode(response.body);
  List<Order> ordersOfUsers = [];
  if (response.statusCode == 200) {
    for (dynamic order in data) {
      ordersOfUsers.add(
        Order(order["id"], order["location"], order["confirmedDate"]),
      );
    }

    return ordersOfUsers;
  } else {
    throw Exception('Failed to load users');
  }
}
