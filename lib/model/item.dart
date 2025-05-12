import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

Future<List<Item>> addItemsToList() async {
  List<Item> itemList = [];

  try {
    // Fetch all records from the 'Products' table
    final response = await Supabase.instance.client
        .from('Products')
        .select()
        .then((response) {
          for (var itemData in response) {
            Item newItem = Item(
              id: itemData["id"] ?? 0,
              url: itemData['url'] ?? '',
              description: itemData['description'] ?? '',
              price: (itemData['price'] as num?)?.toDouble() ?? 0.0,
              location: itemData['location'] ?? 'Ali Baba',
              name: itemData['name'] ?? '',
            );
            itemList.add(newItem);
          }
          debugPrint("The data is fetched successfully");
          return itemList;
        })
        .catchError((error) {
          debugPrint("Error fetching data: $error");
          return itemList;
        });

    return response;
  } catch (e) {
    debugPrint("Exception: $e");
    return itemList;
  }
}
