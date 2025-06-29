import 'package:ecomflutter/Features/HomePage/Data/Models/color.dart';
import 'package:ecomflutter/Features/HomePage/Data/Models/item.dart';
import 'package:ecomflutter/Features/HomePage/Data/Models/size.dart';
import 'package:ecomflutter/utils/usefulFunctions.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  Future<Either<String, List<Item>>> addItemsToList() async {
    final itemsBox = Hive.box<Item>('allProducts');

    // Step 1: Check connection
    final connected = await isConnected();
    if (!connected) {
      final cachedItems = itemsBox.values.toList();
      if (cachedItems.isNotEmpty) {
        debugPrint("Returned cached data from Hive");
        return right(cachedItems);
      } else {
        return left("No internet and no cached data found.");
      }
    }
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
              final imageUrl = Supabase.instance.client.storage
                  .from('products-photos')
                  .getPublicUrl(itemData['url']);
              Item newItem = Item(
                id: itemData["id"] ?? 0,
                url: imageUrl ?? itemData['url'],
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
      await itemsBox.clear();
      await itemsBox.addAll(itemList);
      return right(response);
    } catch (e) {
      debugPrint("Exception: $e");
      return left(e.toString());
    }
  }
}
