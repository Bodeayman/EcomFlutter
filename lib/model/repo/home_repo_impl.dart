import 'package:ecomflutter/model/data/color.dart';
import 'package:ecomflutter/model/data/item.dart';
import 'package:ecomflutter/model/data/size.dart';
import 'package:ecomflutter/utils/usefulFunctions.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<Item>> addItemsToList() async {
  List<Item> itemList = [];
  List<CustomerColor> allColors = [];
  List<CustomerSize> allSizes = [];
  try {
    await Supabase.instance.client.from('Colors').select().then((response) {
      for (var itemData in response) {
        allColors.add(
          CustomerColor(
            color: hexToColor(itemData["colorAdd"]),
            colorName: itemData["colorName"],
            productId: itemData["product_id"],
          ),
        );
      }
    });

    await Supabase.instance.client.from('Sizes').select().then((response) {
      for (var itemData in response) {
        allSizes.add(
          CustomerSize(
            size: itemData["sizeName"],
            productId: itemData["product_id"],
          ),
        );
      }
    });

    final response = await Supabase.instance.client
        .from('Products')
        .select()
        .then((response) {
          for (var itemData in response) {
            List<CustomerColor> itemColors =
                allColors
                    .where((color) => color.productId == itemData["id"])
                    .toList();

            List<CustomerSize> itemSizes =
                allSizes
                    .where((size) => size.productId == itemData["id"])
                    .toList();

            Item newItem = Item(
              id: itemData["id"] ?? 0,
              url: itemData['url'] ?? '',
              description: itemData['description'] ?? '',
              price: (itemData['price'] as num?)?.toDouble() ?? 0.0,
              location: itemData['location'] ?? 'Ali Baba',
              name: itemData['name'] ?? '',
              cat: itemData['cat'] ?? '',
              colors: List.from(itemColors),
              sizes: List.from(itemSizes),
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
