import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Item {
  int id;
  String url;
  String description;
  double price;
  String location;
  String name;
  bool refund;

  Item({
    required this.id,
    required this.url,
    required this.description,
    required this.price,
    required this.location,
    required this.name,
    required this.refund,
  });
}

Future<List<Item>> addItemsToList(String url) async {
  List<Item> itemList = [];

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dynamic responseBody = jsonDecode(response.body);

      // Since the response is a list of items, no need to access 'items' field
      if (responseBody is List) {
        for (var itemData in responseBody) {
          Item newItem = Item(
            id: itemData["id"] ?? 0,
            url:
                itemData["image_url"] ??
                'https://www.dummyimg.in/placeholder?width=600&height=400',
            description: itemData['descr'] ?? '',
            price: itemData['price']?.toDouble() ?? 0.0,
            location: "Ali Baba",
            name: itemData['name'] ?? '',
            refund: itemData["refund"] ?? true,
          );
          //  {
          //       "id": 2,
          //       "name": "Iphone",
          //       "price": 1000,
          //       "descr": "You will feel the luxury when you hold it",
          //       "image_url": "",
          //       "refund": false,
          //       "quantity": 100
          //     }
          itemList.add(newItem);
        }
      }
    }
    debugPrint("The data is fetched successfully");
  } catch (e) {
    debugPrint(e.toString());
  }
  return itemList;
}
