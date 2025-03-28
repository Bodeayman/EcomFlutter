import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Item {
  int id;
  String url;
  String description;
  double price;
  String location;
  String name;

  Item({
    required this.id,
    required this.url,
    required this.description,
    required this.price,
    required this.location,
    required this.name,
  });
}

List<Item> itemList = [];

Future<void> addItemsToList(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dynamic responseBody = jsonDecode(response.body);

      // Since the response is a list of items, no need to access 'items' field
      if (responseBody is List) {
        for (var itemData in responseBody) {
          Item newItem = Item(
            id: itemData["id"] ?? 0,
            url: itemData['image'] ?? '',
            description: itemData['description'] ?? '',
            price: itemData['price']?.toDouble() ?? 0.0,
            location: "Ali Baba",
            name: itemData['title'] ?? '',
          );

          itemList.add(newItem);
        }
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
